# Bitbucket pipeline to deploy nodejs api build code in aws code build and deploy in aws lamda

Bitbucket Pipelines to build and deploy your Node.js API code to AWS CodeBuild and then deploy it to AWS Lambda. Here's an example of a pipeline configuration that does this:

```pipeline
image: node:12

pipelines:
  default:
    - step:
        name: Build and Deploy
        script:
          - npm install
          - npm run build
          - aws codebuild start-build --project-name my-codebuild-project
          - aws lambda update-function-code --function-name my-lambda-function --s3-bucket my-s3-bucket --s3-key path/to/build.zip

```

This pipeline uses the node:12 Docker image, runs npm install and npm run build to build your application, then triggers an AWS CodeBuild build using the aws codebuild start-build command, and finally updates the code on your AWS Lambda function using the aws lambda update-function-code command.

You will need to configure AWS CLI and set the AWS credentials to connect to your AWS account.

You should also replace the placeholders my-codebuild-project, my-lambda-function and my-s3-bucket with the appropriate names for your resources in your AWS account.
