# ServerSpec AWS Example

This repository demonstrates how to write a [ServerSpec](https://serverspec.org/) test for an application that fetches secrets from [AWS Secrets Manager](https://aws.amazon.com/secrets-manager/)

## How is the test built

_AWS_ is mocked through [localstack](https://github.com/localstack/localstack). An instance of _ASM_ is spun up together with the app using [docker-compose](https://docs.docker.com/compose/). Additionally, there is an init container that populates one secret into the mock _ASM_ instance.

## How to run the tests

```
bundle install
bundle exec rspec spec/container_spec.rb
```

## Run the app manually

```
docker-compose up
```

### Checking secrets

`localstack` is exposed when using `docker-compose`. Mock credentials are required

```
export AWS_ACCESS_KEY_ID=stuff
export AWS_SECRET_ACCESS_KEY=happens
```

```
aws secretsmanager list-secrets --endpoint-url http://localhost:4584 --region eu-central-1
```

Storing a secret can be done by doing:

```
aws secretsmanager put-secret-value --endpoint-url http://localhost:4584 --region eu-central-1 --secret-id a_secret --secret-string donttellanybody
```


