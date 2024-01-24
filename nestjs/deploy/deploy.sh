REPO_NAME_PING="nestappping"
REPO_NAME_STATUS="nestappstatus"

cd ..
cd infra
cd registry
terraform init
terraform apply --auto-approve
cd ..
cd ..
cd nestapp

cd ping
cd nestapp

# Build the Docker image and capture the image ID
IMAGE_ID=$(docker build -q -t nestapp:v0.1 .)

# Tag the image with the desired repository and version
docker tag $IMAGE_ID iad.ocir.io/idmaqhrbiuyo/$REPO_NAME_PING:v0.1

# Push the tagged image to the repository
docker push iad.ocir.io/idmaqhrbiuyo/$REPO_NAME_PING:v0.1

echo "docker image nest pushed"


cd ..
cd ..

cd status
cd nestapp

# Build the Docker image and capture the image ID
IMAGE_ID=$(docker build -q -t nestapp2:v0.1 .)

# Tag the image with the desired repository and version
docker tag $IMAGE_ID iad.ocir.io/idmaqhrbiuyo/$REPO_NAME_STATUS:v0.1

# Push the tagged image to the repository
docker push iad.ocir.io/idmaqhrbiuyo/$REPO_NAME_STATUS:v0.1

echo "docker image nest pushed"
cd ..
cd ..
cd ..

cd infra
cd kubernetes
terraform init 
terraform apply --auto-approve

# CLUSTER CONNECT
CLUSTER_ID=$(terraform output -raw k8s-cluster-id)
TF_OUTPUT=$(terraform output k8s-node-pool-id)
TF_OUTPUT="${TF_OUTPUT%\"}"
TF_OUTPUT="${TF_OUTPUT#\"}"
oci ce cluster create-kubeconfig --cluster-id $CLUSTER_ID --file $HOME/.kube/config --region us-ashburn-1 --token-version 2.0.0 --kube-endpoint PUBLIC_ENDPOINT
export KUBECONFIG=$HOME/.kube/config
kubectl get service

cd ..
cd ..
cd scripts


kubectl get service
kubectl apply -f nginx1.yaml
sleep 30
kubectl apply -f namespace1.yaml
sleep 10
kubectl create secret docker-registry ocirsecret --docker-server=iad.ocir.io  --docker-username='idmaqhrbiuyo/apoorva.alshi@impetus.com' --docker-password='3(OQmu[P0g}2::CtP#Z9'  --docker-email='apoorva.alshi@impetus.com' -n app2
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=nginxsvc/O=nginxsvc"
kubectl create secret tls tls-secret --key tls.key --cert tls.crt -n app2
kubectl apply -f deployment-ping.yaml
sleep 200
kubectl apply -f service-ping.yaml
sleep 10
kubectl apply -f ingress-ping.yaml
sleep 30
kubectl get svc --all-namespaces
kubectl apply -f metric.yaml
sleep 30
kubectl -n kube-system get deployment/metrics-server
kubectl apply -f hpa-ping.yaml
sleep 60
kubectl get hpa -n app2
kubectl apply -f hpa-nginx.yaml
sleep 30
kubectl get hpa -n ingress-nginx
sed -E "s|<REPLACE_WITH_DYNAMIC_VALUE>|$TF_OUTPUT|g" autoscaler.yaml > cluster_autoscaler.yaml

kubectl apply -f cluster-autoscaler.yaml
sleep 30
kubectl -n kube-system get cm cluster-autoscaler-status -oyaml    
sleep 10
kubectl apply -f nginx2.yaml
sleep 30
kubectl apply -f namespace2.yaml
sleep 10
kubectl create secret docker-registry ocirsecret --docker-server=iad.ocir.io  --docker-username='idmaqhrbiuyo/apoorva.alshi@impetus.com' --docker-password='3(OQmu[P0g}2::CtP#Z9'  --docker-email='apoorva.alshi@impetus.com' -n app1
kubectl create secret tls tls-secret --key tls.key --cert tls.crt -n app1
kubectl apply -f deployment-status.yaml
sleep 30
kubectl apply -f service-status.yaml
sleep 10
kubectl apply -f ingress-status.yaml
sleep 30
kubectl get svc --all-namespaces
kubectl -n kube-system get deployment/metrics-server
kubectl apply -f hpa-status.yaml
sleep 60
kubectl get hpa -n app1
kubectl apply -f hpa-nginx2.yaml
sleep 30
kubectl get hpa -n ingress-nginx-2

kubectl get svc --all-namespaces
echo "all done"




