require 'aws-sdk-secretsmanager'

# Wait for localstack to be available
sleep 7

asm = Aws::SecretsManager::Client.new(region: ENV['AWS_REGION'], endpoint: 'http://localstack:4584')
asm.create_secret(name: ENV['SECRET_KEY'], secret_string: 'localstack_secret')
