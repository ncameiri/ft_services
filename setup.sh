export MINIKUBE_HOME="/Users/ncameiri/goinfre"
minikube start --vm-driver=virtualbox
export MINIKUBE_HOME="/Users/ncameiri/goinfre"
MINIKUBE_IP=$(minikube ip)
#MINIKUBE_IP=$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)

minikube addons enable metrics-server
minikube addons enable dashboard 
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
sed -i.bak "s/MINIKUBE_IP/$MINIKUBE_IP/g" srcs/yamlfiles/metallb-config.yaml

kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f ./srcs/yamlfiles/metallb-config.yaml
kubectl apply -f ./srcs/yamlfiles/mysql-secret.yaml

eval $(minikube docker-env)

    docker build -t nginx ./srcs/nginx/ 
    docker build -t phpmyadmin ./srcs/phpmyadmin/
    docker build -t wordpress ./srcs/wordpress/
   
    docker build -t grafana ./srcs/grafana/
    docker build -t influxdb ./srcs/influxdb/
    #docker build -t ftps ./srcs/ftps/




    #kubectl delete -f ./srcs/yamlfiles/nginx.yaml
   # kubectl delete -f ./srcs/yamlfiles/phpmyadmin.yaml
    #kubectl delete -f ./srcs/yamlfiles/wordpress.yaml
    ## kubectl delete -f ./srcs/yamlfiles/grafana.yaml
   # kubectl delete -f ./srcs/yamlfiles/influxdb.yaml
   # kubectl delete -f ./srcs/yamlfiles/ftps.yaml

    kubectl create -f ./srcs/yamlfiles/nginx.yaml
    sleep 10     
    kubectl create -f ./srcs/yamlfiles/wordpress.yaml
    sleep 10
    #MINIKUBE_IP=$(kubectl get service -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)
    MINIKUBE_IP=$(kubectl get service wordpress | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | grep "192*")
    sed -i.bak "s/MINIKUBE_IP/$MINIKUBE_IP/g" srcs/mysql/src/wordpress.sql
     docker build -t mysql ./srcs/mysql/
    kubectl create -f ./srcs/yamlfiles/mysql.yaml
    sleep 2
    kubectl create -f ./srcs/yamlfiles/grafana.yaml
      sleep 2
    kubectl create -f ./srcs/yamlfiles/influxdb.yaml
      sleep 2
    kubectl create -f ./srcs/yamlfiles/ftps.yaml
    MINIKUBE_IP=$(kubectl get service ftps | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | grep "192*")
    sed -i.bak "s/MINIKUBE_IP/$MINIKUBE_IP/g" srcs/ftps/vsftpd.conf
      sleep 2
      docker build -t ftps ./srcs/ftps/
      kubectl delete -f ./srcs/yamlfiles/ftps.yaml
      kubectl create -f ./srcs/yamlfiles/ftps.yaml
    kubectl create -f ./srcs/yamlfiles/phpmyadmin.yaml
 kubectl delete -f ./srcs/yamlfiles/nginx.yaml
 sleep 10 
 kubectl create -f ./srcs/yamlfiles/nginx.yaml

    #kubectl delete -f ./srcs/yamlfiles/nginx.yaml
    #kubectl delete -f ./srcs/yamlfiles/phpmyadmin.yaml
    #kubectl delete -f ./srcs/yamlfiles/wordpress.yaml
    #kubectl delete -f ./srcs/yamlfiles/mysql.yaml
    #kubectl delete -f ./srcs/yamlfiles/grafana.yaml
    #kubectl delete -f ./srcs/yamlfiles/influxdb.yaml
    #kubectl delete -f ./srcs/yamlfiles/ftps.yaml

   # docker build -t nginx ./srcs/nginx/
   # docker build -t phpmyadmin ./srcs/phpmyadmin/
   # docker build -t wordpress ./srcs/wordpress/
   # docker build -t mysql ./srcs/mysql/
   # docker build -t grafana ./srcs/grafana/
   # docker build -t influxdb ./srcs/influxdb/
   # docker build -t ftps ./srcs/ftps/

    #kubectl apply -f ./srcs/yamlfiles/nginx.yaml 
    #kubectl apply -f ./srcs/yamlfiles/phpmyadmin.yaml
    #kubectl apply -f ./srcs/yamlfiles/wordpress.yaml
    #kubectl apply -f ./srcs/yamlfiles/mysql.yaml
    #kubectl apply -f ./srcs/yamlfiles/grafana.yaml
    #kubectl apply -f ./srcs/yamlfiles/influxdb.yaml
    #kubectl apply -f ./srcs/yamlfiles/ftps.yaml