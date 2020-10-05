#!/bin/sh
# /etc/profile.d/app-dir-opt.sh
# Set application directory (/opt or ~/app for instance)

export APP_DIR=/opt
export PATH=${APP_DIR}/bin:${PATH}
