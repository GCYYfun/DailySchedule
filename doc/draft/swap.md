#Turn off all swap processes
sudo swapoff -a

#Resize the swap
sudo dd if=/dev/zero of=/swapfile bs=1G count=8
#if = input file
#of = output file
#bs = block size
#count = multiplier of blocks

#Make the file usable as swap
sudo mkswap /swapfile

#Activate the swap file
sudo swapon /swapfile
#Check the amount of swap available
grep SwapTotal /proc/meminfo



curl --silent https://packages.gitlab.com/gpg.key | sudo apt-key add 