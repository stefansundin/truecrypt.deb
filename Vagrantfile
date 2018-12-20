Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.provision "shell", inline:
    <<~EOF
      export DEBIAN_FRONTEND=noninteractive
      add-apt-repository -y ppa:jfi/ppastats
      apt-get update
      apt-get upgrade -y
      apt-get install -y ppastats
    EOF
end
