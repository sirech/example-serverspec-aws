#!/usr/bin/env bash

set -e

secret=$(aws --endpoint-url=http://localstack:4584 --region "${AWS_REGION}" secretsmanager get-secret-value --secret-id "${SECRET_KEY}" | jq -r .SecretString)
export SECRET="$secret"

exec "$@"
