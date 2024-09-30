# truecrypt.deb

> Debianization of TrueCrypt.

The goal of this project is to build a .deb of TrueCrypt 7.1a, plus [a few patches](patches) that fixes minor issues. Besides those improvements, there are no attempts to change the crypto or continue development in any significant way.

For installation instructions, go to: https://launchpad.net/~stefansundin/+archive/ubuntu/truecrypt

#### Other projects

- https://launchpad.net/~eugenesan/+archive/ubuntu/ppa
- https://launchpad.net/~alex-p/+archive/ubuntu/notesalexp-xenial
- http://www.unchartedbackwaters.co.uk/pyblosxom/static/truecrypt_debian_packaging


## Building

### Vagrant

If you are familiar with [Vagrant](https://www.vagrantup.com/), you can simply run this to build the deb file inside a VM:

```shell
git clone https://github.com/stefansundin/truecrypt.deb.git
cd truecrypt.deb
vagrant up
```

Follow the instructions printed by the Vagrantfile.

### Prerequisites

```shell
sudo apt-get install git build-essential devscripts debhelper pkg-config libfuse-dev nasm libgtk-3-dev libwxgtk3.2-dev libayatana-appindicator3-dev bash-completion
```

If you want to use wxformbuilder:

```shell
sudo apt-get install flatpak gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

Then reboot and download the flatpak file here: https://github.com/wxFormBuilder/wxFormBuilder/releases

### Build

```shell
mkdir truecrypt
cd truecrypt
wget https://launchpad.net/~stefansundin/+archive/ubuntu/truecrypt/+files/truecrypt_7.1a.orig.tar.gz
tar xzf truecrypt_7.1a.orig.tar.gz
cd truecrypt-7.1a-source
git clone https://github.com/stefansundin/truecrypt.deb.git debian
debuild -i -us -uc -b
```

### PKCS header files

`pkcs11.h`, `pkcs11f.h` and `pkcs11t.h` were downloaded from ftp://ftp.rsasecurity.com/pub/pkcs/pkcs-11/v2-20/

## fstab

Example `/etc/fstab`:

```
/dev/sdb1 /mnt/secrets truecrypt defaults,users,nofail,password=mightnotbeagoodidea,keyfiles=/mnt/flashdrive/keyfile 0 0
```

See [mount.truecrypt](mount.truecrypt) for usage.

If you mount a device on boot using fstab, it will not show up in the TrueCrypt GUI or in `truecrypt -l` unless you run the program as root. If you then try to mount another device in the same slot, you will receive the error "Volume slot unavailable". To avoid this, you can use `slot=10` to mount the device on a higher slot number, which will leave the common slots available.

## Bash completion for Mac OS X

The bash completion script is not perfectly compatible with Mac OS X, notably the switches with an equal sign do not behave correctly and there are errors printed.

To install with Homebrew:

```shell
ln -s /Applications/TrueCrypt.app/Contents/MacOS/TrueCrypt /usr/local/bin/truecrypt
brew install bash-completion
curl -o /usr/local/etc/bash_completion.d/truecrypt https://raw.githubusercontent.com/stefansundin/truecrypt.deb/master/truecrypt.bash-completion
```


## Misc

- [ppastats](https://stefansundin.github.io/truecrypt.deb/)
- [apt:truecrypt](http://www.appnr.com/install/truecrypt)


# Changelog

[![RSS](https://stefansundin.github.io/img/feed.png) Release feed](https://github.com/stefansundin/truecrypt.deb/releases.atom)

Changelog: [changelog](changelog)
