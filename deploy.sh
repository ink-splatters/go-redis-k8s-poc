#!/bin/bash

script_dir=$(dirname "${BASH_SOURCE[0]}")/k8s
namespace=go-redis-k8s-poc

set -e
set -x

# redis

pushd $script_dir/redis || true


kubectl apply -f redis-namespace.yaml
kubectl apply -f redis-config.yaml --namespace=redis
kubectl apply -f redis-service.yaml --namespace=redis
kubectl apply -f redis-deployment.yaml --namespace=redis

popd || true