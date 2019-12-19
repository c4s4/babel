#!/bin/sh
# /etc/profile.d/golang.sh

export GOROOT=${APP_DIR}/go/current
export GOPATH=${HOME}/.go
export GOTOOLS=${GOPATH}/tol
export PATH=${GOPATH}/bin:${GOTOOLS}/bin:${APP_DIR}/go/current/bin:${PATH}
# fix go on raspberry pi
export GOARM=5
