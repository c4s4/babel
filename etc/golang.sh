#!/bin/sh
# /etc/profile.d/golang.sh

export PATH=/opt/go/current/bin:$PATH
export GOROOT=/opt/go/current
# fix go on raspberry pi
export GOARM=5
