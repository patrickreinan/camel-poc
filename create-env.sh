CONTEXT=camelk

minikube -p $CONTEXT start --cpus=4 --memory=6000
minikube -p $CONTEXT addons enable registry
export REGISTRY_ADDRESS=$(kubectl -n kube-system get service registry -o jsonpath='{.spec.clusterIP}')



helm repo add camel-k https://apache.github.io/camel-k/charts
helm install \
  --generate-name \
  --set platform.build.registry.address=${REGISTRY_ADDRESS} \
  --set platform.build.registry.insecure=true \
  --set platform.cluster=kubernetes \
  camel-k/camel-k
