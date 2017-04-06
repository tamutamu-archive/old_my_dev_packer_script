date > /etc/vagrant_box_build_time

mkdir -pm 700 /home/vagrant/.ssh
curl -L https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub -o /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

echo 'Vagrant authorized_keys:'
cat /home/vagrant/.ssh/authorized_keys

### Add /usr/local/bin
echo 'Defaults    secure_path = /sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin' >> /etc/sudoers.d/vagrant