# truecrypt-deb

> Debianization of TrueCrypt.

For installation instructions, go to: https://launchpad.net/~stefansundin/+archive/ubuntu/truecrypt

## Building

```bash
mkdir truecrypt
cd truecrypt
wget https://launchpad.net/~stefansundin/+archive/ubuntu/truecrypt/+files/truecrypt_7.1a.orig.tar.gz
tar xzf truecrypt_7.1a.orig.tar.gz
cd truecrypt-7.1a-source
git clone https://github.com/stefansundin/truecrypt-deb.git debian
debuild
```

## Stats

- [ppastats](https://stefansundin.github.io/truecrypt-deb/)
