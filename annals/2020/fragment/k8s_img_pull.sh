for i in `kubeadm config images list`; do 
  imageName=${i#k8s.gcr.io/}
  sudo docker pull aiotceo/$imageName
  sudo docker tag aiotceo/$imageName k8s.gcr.io/$imageName
  sudo docker rmi aiotceo/$imageName
done;

