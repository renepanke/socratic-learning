<#
Install the skills without a plugin/marketplace, for Claude Code and/or Codex (Windows).

  .\install.ps1 [claude|codex|all] [-Project DIR] [-Link] [-Uninstall]
  .\install.ps1 zip                 # build one zip per skill in dist\ (Claude.ai upload)

Targets:
  claude  ~\.claude\skills   (with -Project: DIR\.claude\skills)
  codex   ~\.agents\skills   (with -Project: DIR\.agents\skills)
  all     both (default)

If script execution is blocked, run:
  powershell -ExecutionPolicy Bypass -File .\install.ps1
#>
[CmdletBinding()]
param(
  [Parameter(Position = 0)]
  [ValidateSet('claude', 'codex', 'all', 'zip')]
  [string]$Target = 'all',
  [string]$Project = '',
  [switch]$Link,
  [switch]$Uninstall
)
$ErrorActionPreference = 'Stop'

$repo = $PSScriptRoot
$skillsSrc = Join-Path $repo 'skills'
$skills = Get-ChildItem -Path $skillsSrc -Directory

if ($Target -eq 'zip') {
  $dist = Join-Path $repo 'dist'
  New-Item -ItemType Directory -Force -Path $dist | Out-Null
  # Not Compress-Archive: on Windows PowerShell 5.1 it writes backslashes into
  # entry names, which other tools (and uploads) don't read as folders.
  Add-Type -AssemblyName System.IO.Compression, System.IO.Compression.FileSystem
  foreach ($skill in $skills) {
    $zip = Join-Path $dist "$($skill.Name).zip"
    if (Test-Path $zip) { Remove-Item $zip -Force }
    $archive = [IO.Compression.ZipFile]::Open($zip, 'Create')
    try {
      foreach ($file in Get-ChildItem -Path $skill.FullName -File -Recurse) {
        if ($file.Name -eq '.DS_Store') { continue }
        $relative = $file.FullName.Substring($skill.FullName.Length).TrimStart('\', '/') -replace '\\', '/'
        [IO.Compression.ZipFileExtensions]::CreateEntryFromFile($archive, $file.FullName, "$($skill.Name)/$relative") | Out-Null
      }
    } finally {
      $archive.Dispose()
    }
    Write-Host "built dist\$($skill.Name).zip"
  }
  return
}

function Get-Dest([string]$tool) {
  $base = if ($Project) { (Resolve-Path $Project).Path } else { $HOME }
  switch ($tool) {
    'claude' { Join-Path $base '.claude\skills' }
    'codex'  { Join-Path $base '.agents\skills' }
  }
}

function Install-Into([string]$dest) {
  New-Item -ItemType Directory -Force -Path $dest | Out-Null
  foreach ($skill in $skills) {
    $path = Join-Path $dest $skill.Name
    if (Test-Path $path) {
      $item = Get-Item $path -Force
      if ($item.LinkType) {
        # Remove the link itself, never what it points to.
        $item.Delete()
      } else {
        Remove-Item $path -Recurse -Force
      }
    }
    if ($Uninstall) {
      Write-Host "removed $path"
    } elseif ($Link) {
      try {
        New-Item -ItemType SymbolicLink -Path $path -Target $skill.FullName | Out-Null
        Write-Host "linked  $path -> $($skill.FullName)"
      } catch {
        # Symlinks need Developer Mode or admin rights; junctions don't.
        New-Item -ItemType Junction -Path $path -Target $skill.FullName | Out-Null
        Write-Host "linked  $path -> $($skill.FullName) (junction)"
      }
    } else {
      Copy-Item -Path $skill.FullName -Destination $path -Recurse
      Write-Host "copied  $path"
    }
  }
}

if ($Target -eq 'all') {
  Install-Into (Get-Dest 'claude')
  Install-Into (Get-Dest 'codex')
} else {
  Install-Into (Get-Dest $Target)
}

if (-not $Uninstall) { Write-Host "Done. Restart Claude Code / Codex if the skills don't show up." }
