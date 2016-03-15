#!/bin/bash
set -e

if [ "$1" = 'concourse' ] && [ "$2" = 'web' ]; then
    : ${BASIC_AUTH_USERNAME:=ci}
    : ${BASIC_AUTH_PASSWORD:=password}
    : ${POSTGRESQL_PORT:=5432}

    exec concourse web \
        --basic-auth-username $BASIC_AUTH_USERNAME \
        --basic-auth-password $BASIC_AUTH_PASSWORD \
        --session-signing-key $SESSION_SIGNING_KEY \
        --tsa-host-key $TSA_HOST_KEY \
        --tsa-authorized-keys $TSA_AUTHORIZED_KEYS \
        --postgres-data-source postgres://$POSTGRES_USERNAME:$POSTGRES_PASSWORD@$POSTGRES_HOST:$POSTGRESQL_PORT/concourse \
        --external-url $EXTERNAL_URL \
        --peer-url $PEER_URL \
        "$@"
fi

exec "$@"
