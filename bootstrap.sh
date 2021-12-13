#!/usr/bin/env bash
set -e

if ! command -v go; then
    echo no go
    exit 1
fi
set -x
if ! command -v mage; then
  go install github.com/magefile/mage@latest
  go install github.com/magefile/mage@latest
#  cd  "$(go env GOPATH)/pkg/github.com/go magefile/mage" || exit 1
#  go run bootstrap.go
fi