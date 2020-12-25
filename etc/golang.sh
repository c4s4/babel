#!/bin/sh
# /etc/profile.d/golang.sh

export GOROOT=${APP_DIR}/go/current
export GOPATH=${HOME}/.go
export GOTOOLS=${HOME}/.gotools
export PATH=${GOPATH}/bin:${GOTOOLS}/bin:${APP_DIR}/go/current/bin:${PATH}
