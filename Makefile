SHELL := /usr/bin/env bash
TARGET := go-redis-k8s-poc
.DEFAULT_GOAL:  $(TARGET)

# These will be provided to the target
VERSION := 0.1.0
BUILD := $(shell git rev-parse HEAD)
GOPATH := $(shell go env GOPATH)

# Use linker flags to provide version/build settings to the target
LDFLAGS=-ldflags "-X=main.Version=$(VERSION) -X=main.Build=$(BUILD) -X=main.AppName=$(TARGET)"

# go source files, ignore vendor directory

SRC := $(shell find . -type f -name '*.go' -not -path "./vendor/*")

#.PHONY: all build clean install uninstall fmt simplify check run
.PHONY: all build clean fmt pretty simplify check vet run

#all: check install
all: check build

$(TARGET): $(SRC)
	go generate ./...
	@go build $(LDFLAGS) -o $(TARGET)

bootstrap:
	@if ! command -v stringer > /dev/null 2>&1 ; then\
		echo installing golint ;\
		go install golang.org/x/tools/cmd/stringer@latest ;\
	fi
	@if ! command -v golint > /dev/null 2>&1 ; then\
		echo installing stringer ;\
		go install golang.org/x/lint/golint@latest;\
	fi

check: bootstrap
	@test -z $(shell gofmt -l main.go | tee /dev/stderr) || echo "[WARN] Fix formatting issues with 'make fmt'"
	@for d in $$(go list ./... | grep -v /vendor/); do golint $${d}; done


build: $(TARGET)
	@true

clean:
	@rm -f $(TARGET)
	@find . -type f -name '*_string.go' -exec rm -f {} \;

#install:
#	@go install $(LDFLAGS)
#
#uninstall: clean
#	@rm -f $$(which ${TARGET})

pretty: fmt simplify
	@true
fmt:
	@gofmt -l -w $(SRC)

simplify:
	@gofmt -s -l -w $(SRC)


vet: $(TARGET)
	@go vet ./...


run: build
	@go run $(shell pwd)
#run: install
