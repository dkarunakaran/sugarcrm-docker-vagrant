# Architecture
![Vagrant Docker](https://gitlab.squiz.net/dkarunakaran/vagrant-docker-sugarcrm/uploads/496cc1b95cb3a69dcb2eeb7bbe4c97e5/vagrant_docker_centos.png "Vagrant Docker")

# What is Vagrant and Docker?
Vagrant: Vagrant create identical development environment for everyone on your team

Docker: It is similar to Vagrant where Docker can be run on the vm loaded by the Vagrant. Use of Docker here to run multiple sugar system on the same VM. Vagrant provides docker as a provision tool

#### Please note supported Vagrant version is 1.7.2 or above
# Folder structure

1. docker-config directory: it contains docker containers' configuration files
2. Vagrantfile: it contains config to load the VM
3. elasticdata directory: it is used for preserving that data from the elastic docker container
4. dockeload.sh: this file is responsible for calling the necessary files for running docker containers. This file called inside the VM loaded by Vagrant
5. ip.sh: this file get called by dockeload.sh to display the IP address of loaded containers defined in that file.
6. dockerremove.sh: this is called by dockeload.sh to remove the existing containers

Vagrant has shared directory concept and entire cloned directory will be mapped /app directory in the VM. For docker, when you run a docker container, we can specify which directory has to be mapped to the container.

# Procedure to setup the enviornment
1. Install virtual box
2. Install vagrant and run
```
vagrant plugin install vagrant-vbguest
```
3. Clone this repo(Windows users has some issue when cloning, so please download the zip file from repo)
4. Go to the folder
5. Run
```
vagrant up --provision
```
   Please note it's better to follow the instruction under the section of "Important note for Windows 7 users" before vagrant up
6. Wait for the vagrant box installation finishes, then type 10.10.10.11(you can change this ip in Vagarntfile) in your browser
7. For the first time, you may need to enter the download key and validate again. If you are a developer, then you will have access to the key in support.sugarcrm.com. Otherwise ask any CI members


# Important note for Windows7 users

1. Follow below url before Vagrant up

URL: http://www.adamkdean.co.uk/rsync-could-not-be-found-on-your-path

# Squiz Private Download Key

If you are a developer, then you will have access to the key in support.sugarcrm.com. Otherwise ask any CI members

# Steps to create a new sugar container
1) Run
```
vagrant up or reload
```
2) Run
```
vagrant ssh
```
3) Run
```
sudo bash /app/createNewSugarContainer.sh <b>name_of_the_sugar_folder</b><b>new_port</b>
Eg:
 sudo bash /app/createNewSugarContainer.sh sugarcrm76 4000
```
4) If everything is successful, you will have a new directory in docker-config and sugarcrm
5) Type and enter exit
6) Add below config to to Vagrantfile

```
config.vm.network :forwarded_port, guest: new_port_passed_in_script, host: any_port_except_8080_and_3306 to Vagrantfile
Eg:
config.vm.network :forwarded_port, guest: 4000, host: 4036
```

7) Find the supported platforms for the version you wan install to new container. In this case, v7.6 and link you can look at http://support.sugarcrm.com/05_Resources/03_Supported_Platforms/Sugar_7.6.x_Supported_Platforms/
8) If you want changes to the requirement of apache, php etc, then modify the Dockerfile in the new directory created by script.It is located at <b>project root</b>/docker-config/<b>new docker container directory</b>/Dockerfile
9) Download the file from https://store.sugarcrm.com/download However not sure though all the people have access to download the files. Let me know if you can’t download at all
10) Extract the zip file and copy it to the
```
project_root/sugarcrm/new_folder_created_by_script(Eg:sugar76)
```
11) vagrant reload will give you new container up adnd running
12) As sugar installation is happening on the background, to see the installation has been finished, check the progress at install.log after the vagrant reload finshes

```
project_root/sugarcrm/install.log
```

13) After the installtion, run the below url on the browser

```
http://localhost:new_port
Eg:
http://localhost:4036/
```

14) For the first time, you may need to enter the download key and validate again. If you are a developer, then you will have access to the key in support.sugarcrm.com. Otherwise ask any CI members

# Steps to create a Sugar system from backup

Assumption: vagrant is already up, backup of the entire sugar file system, backup of the full sql dump

1) Copy your sql dump to project_path

2) Run
```
vagrant ssh
```
3) Run below command if you haven't installed yet,

```
yum install -y mysql
```

4) Run
```
sudo bash /app/createNewSugarContainer.sh <b>name_of_the_sugar_folder</b><b>new_port</b>
Eg:
 sudo bash /app/createNewSugarContainer.sh sugarcrm76 4000
```
5) If everything is successful, you will have a new directory in docker-config and sugarcrm

6) Run
```
sudo bash /app/ip.sh
```
7) Note the IP of mysql server

8) Run
```
sudo -i
```

9) Run
```
mysql -h IP_of_mysql_server 
```

10) Create a databse with same name as new sugar folder

11) Then import the sqldump file

12) Once you finish with mysql import, exit from vagrant

13) Add below config to to Vagrantfile

```
config.vm.network :forwarded_port, guest: new_port_passed_in_script, host: any_port_except_8080_and_3306 to Vagrantfile
Eg:
config.vm.network :forwarded_port, guest: 4000, host: 4036
```

14) Copy your backup to project_path/sugarcrm/new_folder

15) Make sure db_name points to the new database we just created, username is root and password is empty in config.php

16) Run
```
vagrant reload
```

# Facts
1. Average time for intial vagrant up is <i>10-15</i> minutes depends upton the internet speed
2. Average time taken for subsequent vagrant up or reload is <i>15 to 30 seconds</i>
3. Average time to install a new Sugar container is <i>10 to 15 minutes</i>

# Tested platforms
1. Mac OSX Yosemite
2. Windows 7
3. Windows 8

It is still under active development so please let me know when you encounter an issue.

Email: dkarunakaran@squiz.net
