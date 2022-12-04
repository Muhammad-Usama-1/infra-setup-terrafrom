# Terraform

Infrastructure as code, software tool created by HashiCorp. Users define and provide data center infrastructure using a declarative configuration language known as HashiCorp

## where terraform can be used

Terraform can be used to orchestrate infrastructure changes across several public and private cloud providers. It can also be used to manage software and services making it a diverse infrastructure tool.

## What is the difference between Terraform and CloudFormation?

Terraform and CloudFormation are both infrastructure-as-code (IaC) tools. CloudFormation is developed by AWS and only manages AWS resources. Terraform is developed by HashiCorp and can manage resources across a wide range of cloud vendors.

## benefits of terraform

Using Terraform has several advantages over manually managing your infrastructure: Terraform can manage infrastructure on multiple cloud platforms. The human-readable configuration language helps you write infrastructure code quickly. Terraform's state allows you to track resource changes throughout your deployments.

## Installing Terrafrom

[Terraform Installation](https://www.terraform.io/downloads)

## Check Terrafrom

```bash
terraform --version
```

## AWS Provider

Use the Amazon Web Services (AWS) provider to interact with the many resources supported by AWS. You must configure the provider with the proper credentials before you can use it.

### Authentication and Configuration

Configuration for the AWS Provider can be derived from several sources, which are applied in the following order

1. Parameters in the provider configuration

Credentials can be provided by adding an access_key, secret_key, and optionally token, to the aws provider block.

```bash
provider "aws" {
  region     = "us-west-2"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}
```

1. Environment variables

Credentials can be provided by using the AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, and optionally AWS_SESSION_TOKEN environment variables. The region can be set using the AWS_REGION or AWS_DEFAULT_REGION environment variables.

``bash
provider "aws" {}

export AWS_ACCESS_KEY_ID="anaccesskey"

export AWS_SECRET_ACCESS_KEY="asecretkey"

export AWS_REGION="us-west-2"
``

1. Shared credentials files

The AWS Provider can source credentials and other settings from the shared configuration and credentials files. By default, these files are located at $HOME/.aws/config and $HOME/.aws/credentials on Linux and macOS, and "%USERPROFILE%\.aws\config" and "%USERPROFILE%\.aws\credentials" on Windows.

If no named profile is specified, the default profile is used. Use the profile parameter or AWS_PROFILE environment variable to specify a named profile.

The locations of the shared configuration and credentials files can be configured using either the parameters shared_config_files and shared_credentials_files or the environment variables AWS_CONFIG_FILE and AWS_SHARED_CREDENTIALS_FILE.

For example:

```bash
provider "aws" {
  shared_config_files      = ["/Users/tf_user/.aws/conf"]
  shared_credentials_files = ["/Users/tf_user/.aws/creds"]
  profile                  = "customprofile"
}

```

1. Shared configuration files
1. Container credentials
1. Instance profile credentials and region

## Create ec2 instance in AWS

```bash
resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}
```

Your Code So far now

Now lets see in action , create a file name main.tf

```bash
provider "aws" {
  region     = "us-west-2"
  #If you already configure acces using (aws configure you dont need to proivde here keys again)
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}

resource "aws_instance" "web" {
    # We need ami (diffenrent ami for image like aws, ubntu etc)
    ami = "xxxxxxxxxxxxxxxxxx"
    instance_type = "t3.micro"

    tags = {
     Name = "HelloWorld"
   }
}
```

This code will create a ec2 instance in AWS(Not exactly bcz ami is still missing)

Now lets see how we can get ami from aws console
