#!/bin/sh
# ~/.profile.d/golang.sh

export GOROOT=${APP_DIR}/go/current
export GOPATH=${HOME}/.go
export PATH=${GOPATH}/bin:${APP_DIR}/go/current/bin:${PATH}
# fix go on raspberry pi
export GOARM=5
