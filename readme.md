## Creating manifest file

```sh
kamel init test.java
```

```sh
kamel run test.java -o yaml \
--trait service.enabled=true \
--trait service.auto=true \
--trait service.node-port=false \
> test.yaml
```

## Apply manifest
```sh
kubectl apply -f test.yaml
```

