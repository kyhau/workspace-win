:: Run as Administrator

:: Installing chocolatey from CMD
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
:: OR
:: Installing chocolatey from Powershell
:: Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Packages - see https://chocolatey.org/packages

choco install -y ^
  awscli ^
  awstools.powershell ^
  cyberduck ^
  docker-for-windows ^
  firefox ^
  git ^
  gitkraken ^
  itunes^
  nano^
  notepadplusplus ^
  nordvpn ^
  protonvpn ^
  putty ^
  pycharm-community ^
  signal ^
  sysinternals --params "/InstallDir:C:\Sysinternals" ^
  vscode ^
  winrar
::  activepresenter ^
::  avastfreeantivirus ^
::  dependencywalker ^
::  everything ^
::  gh ^
::  googlechrome ^
::  google-backup-and-sync ^
::  jre8 ^
::  kdiff3 ^
::  keepassxc ^
::  lazydocker ^
::  nosql-workbench ^
::  openvpn --params="'/SELECT_OPENVPNGUI=1'" ^
::  pgadmin4 ^
::  postman ^
::  qgis ^
::  rdcman ^
::  saml2aws ^
::  slack ^
::  sourcetree ^
::  superputty ^
::  windirstat ^

:: Install wireshark and winpcap (winpcap is the capture library required for wireshark)
::  winpcap ^
::  wireshark ^

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Dev
choco install -y python3 ---version 3.8 -override --installarguments "'/quiet  InstallAllUsers=1 TargetDir=c:\Python38'"

choco install jq

choco install -y golang

choco install -y nodejs

::choco install -y sbt scala

:: Confirm what have been installed
choco list --localonly
