#!/usr/bin/env bash

set -e

until aws --endpoint-url=http://localstack:4584 --region "${AWS_REGION}" secretsmanager list-secrets
do
  sleep 3
done

# Give the init container time to do its thing
sleep 3

secret=$(aws --endpoint-url=http://localstack:4584 --region "${AWS_REGION}" secretsmanager get-secret-value --secret-id "${SECRET_KEY}" | jq -r .SecretString)
export SECRET="$secret"

exec "$@"
