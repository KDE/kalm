# Kalm
Kalm can teach you different breathing techniques.

<a href='https://flathub.org/apps/details/org.kde.kalm'><img width='190px' alt='Download on Flathub' src='https://flathub.org/assets/badges/flathub-badge-i-en.png'/></a>

## Build
### Dependencies
#### Arch Linux
```
sudo pacman -Syu cmake extra-cmake-modules gcc git make
```

### Clone and Build
```
git clone https://invent.kde.org/utilities/kalm.git
cd kalm
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make
```

### Install
```
sudo make install
```

### Flatpak
```
flatpak install org.kde.Sdk/x86_64/5.15-21.08
flatpak install org.kde.Platform/x86_64/5.15-21.08
flatpak-builder --user --install --force-clean build org.kde.kalm.yml
flatpak run org.kde.kalm
```

## Run
```
kalm
```
