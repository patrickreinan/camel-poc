REGISTRY_SECRET_NAME=registry-secret
REGISTRY_ADDRESS=nexus-rm-nexus-repository-manager-docker-5000


helm repo add camel-k https://apache.github.io/camel-k/charts

helm upgrade -i camelk \
  --set platform.build.registry.address=${REGISTRY_ADDRESS} \
  --set platform.build.registry.insecure=false \
  --set platform.build.registry.secret=$REGISTRY_SECRET_NAME \
  --set platform.cluster=kubernetes \
  camel-k/camel-k


