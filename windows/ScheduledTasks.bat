@ECHO OFF

:: Run as Admin

powershell -Command "choco upgrade all -y"

powershell -Command "C:\Workspaces\github\workspace\windows\Run-WindowsUpdate.ps1"


:: Run as User

C:\Workspaces\github\workspace\windows\DeleteChromeHistory.bat

C:\Workspaces\github\workspace\vscode\backup_settings.bat

python C:\Workspaces\github\workspace\firefox\backup_multi_containers_extension_settings.py

pushd C:\Workspaces\github
C:\Workspaces\github\workspace\git\run_git_pull.bat
popd
