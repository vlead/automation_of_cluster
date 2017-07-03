#! /bin/bash

password=vlead123

sed -i '/proxy=.*/d' /etc/yum.conf
echo 'proxy=http://proxy.iiit.ac.in:8080' >> /etc/yum.conf


yum install epel-release -y
yum install ansible -y
yum install emacs -y
yum install sshpass -y


ssh-keygen -t rsa -f /root/.ssh/id_rsa -q -P ""

echo 'StrictHostKeyChecking no' >> /etc/ssh/ssh_config

sudo mknod -m 666 /dev/tty c 5 0
sshpass -p $password ssh-copy-id root@localhost
sshpass -p $password ssh-copy-id root@127.0.0.1

