# Workspace

Quick development environment setup

## Windows

Install [Chocolatey](https://chocolatey.org) and some packages with [init_chocolatey_windows10.bat](chocolatey/init_chocolatey_windows10.bat).

### Ubuntu on Windows 10

- [Install Windows Subsystem for Linux (WSL) on Windows 10](https://msdn.microsoft.com/en-au/commandline/wsl/install_guide).
- Git clone this repo to `/mnt/c/Workspaces/github/workspace`.
- Copy or create symlink from personal `.bashrc` to `$HOME/.bashrc`
- Run [init_setup.sh](ubuntu/setup/init_setup.sh), which does
    - Set up `chmod/chown` support
    - Set up Python, Docker, Git, git_secrets, saml2aws, etc.
    - Set symlinks to the corresponding Windows home folders

Useful notes
- Check current distribution and version
    ```powershell
    wsl -l -v
    ```
- To converting your distro from WSL 2 back to WSL 1
    ```powershell
    wsl --set-version Ubuntu 1
    ```
- Setup `chmod/chown` support: use [`wsl.conf`](ubuntu/wsl.conf) as detailed in
  [Unable to change file permissions on Ubuntu Bash for Windows 10](https://superuser.com/questions/1323645/unable-to-change-file-permissions-on-ubuntu-bash-for-windows-10).
- Note that the `umount/mount` approach in
  [Chmod/Chown WSL Improvements](https://blogs.msdn.microsoft.com/commandline/2018/01/12/chmod-chown-wsl-improvements/)
  does not work (error on re-mounting).
- Fixing WSL2 npm issue: "/mnt/c/Program Files/nodejs/npm: /bin/sh^M: bad interpreter" (https://hackmd.io/@badging/wsl2)
    ```bash
    PATH=$(echo "$PATH" | sed -e 's/:\/mnt.*//g') # strip out problematic Windows %PATH%
    ```

### Docker-for-Windows

- For MacBook Pro Windows user, see
  [Turn on Hardware Virtualization on MacBook Pro for Windows using Boot Camp](https://apple.stackexchange.com/questions/120361/how-to-turn-on-hardware-virtualization-on-late-2013-macbook-pro-for-windows-8-1?).
- https://forums.docker.com/t/volume-mounts-in-windows-does-not-work/10693/18
- For WSL 2, unset `DOCKER_HOST`, see https://stackoverflow.com/questions/60708229/wsl2-cannot-connect-to-the-docker-daemon
- docker-compose
   - To install `docker-compose`: `pip install docker-compose`
   - If see error `docker.credentials.errors.InitializationError: docker-credential-desktop.exe not installed or not available in PATH`
      - Add `_` before `credsStore` in file ~/.docker/config.json, i.e. `{"_credsStore":"desktop.exe"}` 
- If see error [`no matching manifest for windows/amd64 in the manifest list entries`](https://stackoverflow.com/questions/48066994/docker-no-matching-manifest-for-windows-amd64-in-the-manifest-list-entries)
   - Go to Settings: Daemon, Advanced
   - Set the "experimental": true
   - Restart Docker

### Locations of some useful files or directories

- Chrome History `%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\History`
- Firefox container file: `%USERPROFILE%\AppData\Roaming\Mozilla\Firefox\Profiles\xx\containers.json`
- Taskbar shortcuts pinned by admin (CustomTaskbarLayoutCollection): `%USERPROFILE%\AppData\Local\Microsoft\Windows\Shell\LayoutModification.xml`
- WSL 1 Ubuntu home: `%USERPROFILE%\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_xxx\LocalState\rootfs\home\username`
- WSL 2 Ubuntu home: `\\wsl$\Ubuntu`
