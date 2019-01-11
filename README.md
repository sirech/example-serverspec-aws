# ServerSpec AWS Example

This repository demonstrates how to write a [ServerSpec](https://serverspec.org/) test for an application that fetches secrets from [AWS Secrets Manager](https://aws.amazon.com/secrets-manager/)

## How is the test built

_AWS_ is mocked through [localstack](https://github.com/localstack/localstack). An instance of _ASM_ is spun up together with the app using [docker-compose](https://docs.docker.com/compose/). Additionally, there is an init container that populates one secret into the mock _ASM_ instance.

## How to run the tests

```
bundle install
bundle exec rspec spec/container_spec.rb
```
-
