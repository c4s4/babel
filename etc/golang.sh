#!/bin/sh
# /etc/profile.d/golang.sh

export GOROOT=/opt/go/current
export GOPATH=${HOME}/.go
export PATH=${GOPATH}/bin:/opt/go/current/bin:${PATH}
# fix go on raspberry pi
export GOARM=5
