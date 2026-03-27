# TODO: maybe handle multiple files?
$pathInput = if ($args.Count -gt 0) { $args[0] } else { "." }
$filePath = (Resolve-Path -LiteralPath $pathInput).Path

# NOTE: we need to do this with bash becasue other shells may cause issues
$wslPath = wsl.exe /bin/bash -c "wslpath '$filePath'"

if ($LASTEXITCODE -ne 0) {
    Pause
    exit 1
}

# Launch Neovim inside WSl
Start-Process -Wait "wsl.exe" -ArgumentList "nvim -p '$wslPath'" -NoNewWindow
