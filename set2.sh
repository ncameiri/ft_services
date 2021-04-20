minikube addons enable metrics-server
minikube addons enable dashboard 
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml

kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f ./srcs/yamlfiles/metallb-config.yaml
kubectl apply -f ./srcs/yamlfiles/mysql-secret.yaml

eval $(minikube docker-env)

    docker build -t nginx ./srcs/nginx/
    docker build -t phpmyadmin ./srcs/phpmyadmin/
    docker build -t wordpress ./srcs/wordpress/
    docker build -t mysql ./srcs/mysql/
    docker build -t grafana ./srcs/grafana/
    docker build -t influxdb ./srcs/influxdb/
    docker build -t ftps ./srcs/ftps/


    #kubectl delete -f ./srcs/yamlfiles/nginx.yaml
   # kubectl delete -f ./srcs/yamlfiles/phpmyadmin.yaml
    #kubectl delete -f ./srcs/yamlfiles/wordpress.yaml
    ## kubectl delete -f ./srcs/yamlfiles/grafana.yaml
   # kubectl delete -f ./srcs/yamlfiles/influxdb.yaml
   # kubectl delete -f ./srcs/yamlfiles/ftps.yaml

    kubectl create -f ./srcs/yamlfiles/nginx.yaml     
    kubectl create -f ./srcs/yamlfiles/wordpress.yaml
    kubectl create -f ./srcs/yamlfiles/mysql.yaml
    kubectl create -f ./srcs/yamlfiles/grafana.yaml
    kubectl create -f ./srcs/yamlfiles/influxdb.yaml
    kubectl create -f ./srcs/yamlfiles/ftps.yaml
    kubectl create -f ./srcs/yamlfiles/phpmyadmin.yaml
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