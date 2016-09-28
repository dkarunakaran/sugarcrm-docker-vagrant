# -*- mode: ruby -*-
# vi: set ft=ruby :

# Specify Vagrant version and Vagrant API version
Vagrant.require_version ">= 1.7.0"
VAGRANTFILE_API_VERSION = "2"

# Create and configure the VM(s)
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Assign a friendly name to this host VM
  config.vm.hostname = "sugarcrm"

  # Skip checking for an updated Vagrant box
  config.vm.box_check_update = false

  # Always use Vagrant's default insecure key
  config.ssh.insert_key = false

  # Spin up a "host box" for use with the Docker provider
  # and then provision it with Docker
  config.vm.box = "puphpet/centos65-x64"
  #config.vm.box = "centos/7"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "10.10.10.11"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 3306, host: 3306
  config.ssh.forward_agent = true

  config.vm.provision "shell", run: :always, inline: <<-SHELL

    #Turning iptable off
    chkconfig iptables off
    service iptables stop

  SHELL

  config.vm.provision "shell" do |s|
    s.inline = "groupadd -f docker"
  end

  config.vm.provision "docker"

  # Disable synced folders (prevents an NFS error on "vagrant up")
  config.vm.synced_folder ".", "/vagrant", disabled: true

  #non-windows users - windows doesnt support nfs
  config.vm.synced_folder ".", "/app", nfs: true

  config.vm.provider "virtualbox" do |v|
    host = RbConfig::CONFIG['host_os']

    # Give VM 1/4 system memory & access to all cpu cores on the host
    if host =~ /darwin/
      cpus = `sysctl -n hw.ncpu`.to_i
      # sysctl returns Bytes and we need to convert to MB
      mem = `sysctl -n hw.memsize`.to_i / 1024 / 1024 / 2
    elsif host =~ /linux/
      cpus = `nproc`.to_i
      # meminfo shows KB and we need to convert to MB
      mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i / 1024 / 2
    else # sorry Windows folks, I can't help you
      cpus = 2
      mem = 1024
    end

    v.customize ["modifyvm", :id, "--memory", mem]
    v.customize ["modifyvm", :id, "--cpus", cpus]

  end

  # Start docker continers
  config.vm.provision "shell", run: :always, inline: <<-SHELL

    #Installing git
    #yum install -y git
    #git --version

    #Restarting Docker after iptables turned off
    service docker restart

    bash /app/dockerload.sh
    echo "-----------------IP Addresses-----------------"
    bash /app/ip.sh
  SHELL

end