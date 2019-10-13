ENV["LC_ALL"] = "en_US.UTF-8"

$root_provision = <<SCRIPT
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get upgrade -y
apt-get install -y git gnupg2 vim
apt-get install -y devscripts debhelper pkg-config libgtk2.0-dev libfuse-dev nasm libappindicator-dev bash-completion
SCRIPT

$user_provision = <<SCRIPT
echo 'export PKCS11_INC=$HOME/truecrypt-7.1a-source/debian/pkcs11' >> ~/.bashrc

echo "Downloading truecrypt_7.1a.orig.tar.gz"
wget -q https://launchpad.net/~stefansundin/+archive/ubuntu/truecrypt/+files/truecrypt_7.1a.orig.tar.gz

tar xzf truecrypt_7.1a.orig.tar.gz
cd truecrypt-7.1a-source
ln -s /vagrant debian
SCRIPT

$version = File.read("#{__dir__}/changelog")[/7.1a-[^)]+/]

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.hostname = "truecrypt.deb"
  config.vm.provision "shell", inline: $root_provision
  config.vm.provision "shell", inline: $user_provision, privileged: false
  config.vm.post_up_message = <<EOF
Run `vagrant ssh`, then run:
cd truecrypt-7.1a-source
debuild -i -us -uc -b

To copy the finished deb file out of the VM, run:
cp ../truecrypt_#{$version}_amd64.deb /vagrant/
cp ../truecrypt-cli_#{$version}_amd64.deb /vagrant/
EOF
end
