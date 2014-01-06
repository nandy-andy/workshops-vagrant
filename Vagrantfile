VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider "virtualbox" do |v|
    v.name = "wikia-workshops-vm"
  end

  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.synced_folder '.', '/vagrant',
    id: 'vagrant-root',
    owner: 'vagrant',
    group: 'www-data'
end
