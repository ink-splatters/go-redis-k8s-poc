# go-redis-k8s-poc
ACID compliant REST CRUD using Redis for persistence, deployed in k8s


## Build
1. bootstrap.sh
```bash
go get -u -d github.com/magefile/mage
pushd $(go env GOPATH)/src/github.com/magefile/mage
go run bootstrap.go

```