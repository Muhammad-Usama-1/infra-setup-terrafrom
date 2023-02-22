Update swap File in Ubuntu,

Becasue have swapfile already, off it

sudo swapoff /swapfile

I am creating here 4gb of swap , choice is totally yours

sudo dd if=/dev/zero of=/swapfile bs=128M count=32

sudo chmod 600 /swapfile
sudo swapon /swapfile
sudo vi /etc/fstab

/swapfile swap swap defaults 0 0
