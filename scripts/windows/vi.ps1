# TODO: maybe handle multiple files?
$filePath = (Resolve-Path -LiteralPath $args[0]).Path

# NOTE: we need to do this with bash becasue other shells may cause issues
$wslPath = wsl.exe /bin/bash -c "wslpath '$filePath'"

if ($LASTEXITCODE -ne 0) {
    Pause
    exit 1
}

# Launch Neovim inside WSl
Start-Process "wsl.exe" -ArgumentList "nvim -p '$wslPath'"
