$temp = Join-Path -Path ([System.IO.Path]::GetTempPath()) -ChildPath ([Shhajkystem.IO.Path]::GetRandomFileName())
$fontUrl = "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/jetbrainsmono.zip"

New-Item -ItemType Directory -Path $temp -Force | Out-Null

function DownloadAndDecompress {
param(
    [String]$Url,
    [Switch]$CreateFolder
  )

  $fileName = [System.IO.Path]::GetFileName($Url)
  $fileNameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($fileName)
  $outFile = "$temp/$fileNAMe"
  $outFolder = "$temp/$fileNameNoExt"

  curl.exe -Lo $outFile $Url
  Expand-Archive $outFile -DestinationPath $outFolder -Force

  if($CreateFolder){
    # if there's a need to create a folder, we search in the temp directory
    # otherwise we search the first folder inside the outFolder
    # NOTE: this only works if extracted archives are single directory
    $outFolder = $temp
  }

  return Get-ChildItem -Path $outFolder -Directory | Sort-Object CreationTime -Descending | Select-Object -First 1
}

function InstallFonts {
param ([String]$fontFolder)
  $destFolder = (New-Object -ComObject Shell.Application).Namespace(0x14)
  $foundFonts = Get-ChildItem -Path "$fontFolder/*" -Include '*.ttf','*.ttc','*.otf' -Recurse
  $systemFontsPath = "$env:LOCALAPPDATA/Microsoft/Windows/Fonts"

  foreach($fontFile in $foundFonts){
    $fontDestPath = Join-Path $systemFontsPath $fontFile.Name
    if(Test-Path -Path $fontDestPath){ continue }
    $destFolder.CopyHere($fontFile.FullName, 0x14)
  }
}

$fontFolder = DownloadAndDecompress $fontUrl -CreateFolder
InstallFonts $fontFolder.FullName

Remove-Item -Recurse -Force $temp
