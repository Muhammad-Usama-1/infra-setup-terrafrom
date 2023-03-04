# Learn how to Automatically stop Start EC2 instance at your sheduled time

create a rule
https://me-south-1.console.aws.amazon.com/events/home?region=me-south-1#/rules/create

name practical-ec2-restart-rule
description This rule will trigger lamda for stoping starting ec2 in working days
select rule type SCHEDULE
NEXT
0 11,23 ? _ 1-5 _
choose target as lamda function

now create a lamda

```python
import boto3
region = 'me-south-1'
instances = ['instance-id']
ec2 = boto3.client('ec2', region_name=region)

def lambda_handler(event, context):
    ec2.stop_instances(InstanceIds=instances)
    print('stopped your instances: ' + str(instances))
```

UTC time: 18
Pakistan time = UTC time + UTC offset for Pakistan (5)
Pakistan time = 18 + 5
Pakistan time = 23

UTC time: 06
Pakistan time = UTC time + UTC offset for Pakistan (5)
Pakistan time = 06 + 5
Pakistan time = 11

---

---

create a role name ec2-secrets-access, attach policy of SecretsManagerReadWrite

click instance --> Action --> security --> Modify IAM role

arn:aws:secretsmanager:<REGION>:<ACCOUNT-ID>:secret:<SECRET-NAME>

{
"Version": "2012-10-17",
"Statement": [
{
"Sid": "VisualEditor0",
"Effect": "Allow",
"Action": [
"secretsmanager:GetResourcePolicy",
"secretsmanager:GetSecretValue",
"secretsmanager:DescribeSecret",
"secretsmanager:ListSecretVersionIds"
],
"Resource": "REPLACE ME WITH REAL ARN OF THE SECRET"
},
{
"Sid": "VisualEditor1",
"Effect": "Allow",
"Action": [
"secretsmanager:GetRandomPassword",
"secretsmanager:ListSecrets"
],
"Resource": "\*"
}
]
}
