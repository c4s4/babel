#!/bin/sh
# /etc/profile.d/rust.sh

export PATH=${APP_DIR}/rust/current/bin:${PATH}
export LD_LIBRARY_PATH=${APP_DIR}/rust/current/lib/:${LD_LIBRARY_PATH}
