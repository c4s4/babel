#!/bin/sh
# ~/.profile.d/psql.sh

export PATH=${APP_DIR}/psql/current/bin:${PATH}

export PGHOST="localhost"
export PGPORT="5432"
export PGPASSWORD=""
if [ "${APP_DIR}" = "${HOME}/app" ]
then
    export PGUSER="${USER}"
else
    export PGUSER="postgres"
fi
