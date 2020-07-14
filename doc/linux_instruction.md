


docker 启动 runner

 docker run -d --name gitlab-runner-test --restart always \
     -v /srv/gitlab-runner/config:/etc/gitlab-runner \
     -v /var/run/docker.sock:/var/run/docker.sock \
     gitlab/gitlab-runner:latest

进入 docker  docker exec -it gitlab-runner-test /bin/bash

gitlab-runner register


runnner 安装
https://docs.gitlab.com/runner/install/linux-manually.html

https://docs.gitlab.com/runner/install/linux-repository.html

runner 形式
https://docs.gitlab.com/runner/executors/docker.html



gitlab-ctl tail

vi /etc/gitlab/gitlab.rb 


docker 安装 gitlab
https://docs.gitlab.com/ee/install/docker.html

具体
https://docs.gitlab.com/omnibus/docker/

doker run --detach 

sudo docker run --detach \
  --hostname gitlab.own.com \
  --publish 443:443 --publish 8000:80 --publish 2222:22 \
  --name gitlab \
  --restart always \
  --volume $GITLAB_HOME/config:/etc/gitlab \
  --volume $GITLAB_HOME/logs:/var/log/gitlab \
  --volume $GITLAB_HOME/data:/var/opt/gitlab \
  gitlab/gitlab-ce:latest



油箱
https://www.cnblogs.com/youzhibing/p/12487043.html