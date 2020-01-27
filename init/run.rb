require 'aws-sdk-secretsmanager'

asm = Aws::SecretsManager::Client.new(region: ENV['AWS_REGION'], endpoint: 'http://localstack:4584')

# Wait for localstack to be available
begin
  retries ||= 0
  asm.list_secrets
rescue Seahorse::Client::NetworkingError
  sleep 1
  retry if (retries += 1) < 20
end

asm.create_secret(name: ENV['SECRET_KEY'], secret_string: 'localstack_secret')
