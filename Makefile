SHELL := /usr/bin/env bash

TARGET := go-redis-k8s-poc

all: bootstrap build test

bootstrap:
	
build:
	go build -o ${BINARY_NAME} .

test:
	go test -v .
#run:
#    go build -o ${BINARY_NAME} main.go
#    ./${BINARY_NAME}

#clean:

