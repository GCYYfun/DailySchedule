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



curl --silent https://packages.gitlab.com/gpg.key | sudo apt-key add -



安装 
https://about.gitlab.com/install/#ubuntu

文档
https://docs.gitlab.com/omnibus/README.html#installation-and-configuration-using-omnibus-package



https://gitlab.com/gitlab-org/omnibus-gitlab/blob/master/doc/common_installation_problems/README.md#reconfigure-freezes-at-ruby_blocksupervise_redis_sleep-action-run




sudo docker run --detach \
  --hostname gitlab.own.com \
  --publish 443:443 --publish 8080:80 --publish 2222:22 \
  --name gitlab \
  --restart always \
  --volume $GITLAB_HOME/config:/etc/gitlab \
  --volume $GITLAB_HOME/logs:/var/log/gitlab \
  --volume $GITLAB_HOME/data:/var/opt/gitlab \
  gitlab/gitlab-ce




Notify.test_email('734536637@qq.com', '邮件主题', '邮件正文').deliver_now