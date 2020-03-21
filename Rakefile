require 'rspec/core/rake_task'

task :deploy do
  sh <<~EOC
    set -x

    source .env

    PROJECT_NAME="${PROJECT_NAME:-$(basename $PWD)}"
    ENVIRON="${ENVIRON:-Dev}"
    
    ARTIFACTS_BUCKET="${ARTIFACTS_BUCKET:-$PROJECT_NAME}"
    ARTIFACTS_PREFIX="${ARTIFACTS_PREFIX:-''}"

    STACK_NAME="${PROJECT_NAME}${ENVIRON}"

    echo "Creating vendor bundle"
    bundle install --deployment
    echo

    echo "Packaging application"
    aws cloudformation package \
      --template-file template.yaml \
      --output-template-file serverless-output.yaml \
      --s3-bucket "${ARTIFACTS_BUCKET}" \
      ${ARTIFACTS_PREFIX:+ --s3-prefix "${ARTIFACTS_PREFIX}"} || exit $?
    echo

    echo "Deploying application stack"
    aws cloudformation deploy \
      --template-file serverless-output.yaml \
      --stack-name "${STACK_NAME}" \
      --capabilities CAPABILITY_IAM || exit $?
    echo

    echo "Retrieving stack outputs"
    aws cloudformation describe-stacks \
      --stack-name "${STACK_NAME}" \
      --query 'Stacks[0].Outputs'
  EOC
end

RSpec::Core::RakeTask.new :specs do |task|
  task.pattern = Dir['spec/**/*_spec.rb']
end

task :default => ['specs']
