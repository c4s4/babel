#!/bin/sh
# /etc/profile.d/golang.sh

export PATH=/opt/go/current/bin:${PATH}
export GOROOT=/opt/go/current
export GOPATH=${HOME}/.go
export PATH=${GOPATH}/bin:${PATH}
# fix go on raspberry pi
export GOARM=5
