# YCSB-Pod

Simple pod equipped with a subset of [YCSB](https://github.com/brianfrankcooper/YCSB) bindings. Bindings can be controlled via the REQ_YCSB_BINDS. This has the advantage that not all bindings (image size >800MB) have to be used. A sample image with the elasticsearch-binding can be found on [Dockerhub](https://hub.docker.com/r/simontheleg/ycsb-pod/).

## Running inside Kubernetes

```shell
kubectl run ycsb-pod --image=simontheleg/ycsb-pod:v1.0.0
kubectl exec -it <pod-id> /bin/bash
```

clean up

```shell
kubectl delete deploy ycsb-pod
```

## Building & publishing

```shell
docker build -t simontheleg/ycsb-pod:v1.0.0 .
docker push simontheleg/ycsb-pod:v1.0.0
```