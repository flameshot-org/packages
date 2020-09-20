<div align="center">
  <p>
    <h1>
      <a href="https://github.com/lupoDharkael/flameshot">
        <img src="flameshot.svg" alt="Flameshot" />
      </a>
      <br />
      Flameshot
    </h1>
    <h3>Snap, Flatpak, Appimage packages for flameshot.</h3>
    <h5>Powerful yet simple to use screenshot software.</h5>
  </p>
  <p>
    <a href="https://travis-ci.org/flameshotapp/packages">
      <img src="https://img.shields.io/travis/flameshotapp/packages.svg?style=flat-square&label=appimage/snap/flatpak" alt="AppImage/Snap/Flatpak Build Status" />
    </a>
    <a href="https://github.com/flameshotapp/packages/releases">
      <img src="https://img.shields.io/github/downloads/flameshotapp/packages/total.svg?style=flat-square" alt="Total Downloads" />
    </a>
<!--     <a href="https://build.snapcraft.io/user/flameshotapp/packages">
      <img src="https://build.snapcraft.io/badge/flameshotapp/packages.svg" alt="Snapcraft Status" />
    </a> -->
  </p>
</div>

- `AppImage`: Get it from [Release](https://github.com/flameshotapp/packages/releases) page, or:
  1. Download the latest AppImage (remember to move the file to where ever you want to store it):
   ```sh
   curl -O -J -L $(curl -s https://api.github.com/repos/flameshot-org/flameshot/releases/latest \
                | grep -Po 'https://github.com/flameshot-org/flameshot/releases/download/[^}]*\.AppImage' \
                | uniq)
   ```
  
  2. Delete older versions of Flameshot AppImage
  
  3. Set it to executable:
  ```sh
  chmod +x Flameshot-*-x86_64.AppImage
  ```
  
  4. Run the software:
   ```sh
   ./Flameshot-*-x86_64.AppImage
   ```
  
- `Snap`: 
  1. Install Snap from file
   `snap install --dangerous flameshot-app_v0.6.0_amd64.snap`

  2. Install multiple versions of Snaps from file
      `snap install --dangerous --name flameshot_beta flameshot-app_v0.6.0_amd64.snap`
  3. See all Snaps installed:
      `snap list`
  4. Run Snaps:
      `snap run flameshot`
- ~~`Flatpak`: waiting...~~

