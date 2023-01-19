# What is DynamoDB

DynamoDB allows you to store and retrieve data using a simple key-value access model, and it also supports more advanced querying and indexing options. Some of the key features of DynamoDB include:

Automatic and on-demand scaling of throughput capacity
Support for both document and key-value data models
Integration with other AWS services such as Lambda, S3, and CloudWatch
Strong consistency for data reads
Encryption at rest and in transit

DynamoDB is a popular choice for building highly available and performant applications, as it allows developers to offload the operational burden of managing a database to AWS.

# Amazon DynamoDB Streams

Amazon DynamoDB Streams is a feature of DynamoDB that allows you to capture data modification events in DynamoDB tables. These streams can then be used as triggers for other AWS services such as Lambda, allowing you to perform additional actions in response to changes in your data. For example, you could use a DynamoDB stream to trigger a Lambda function that sends a notification to an SNS topic, or updates a different DynamoDB table,

# Indexes

In Amazon DynamoDB, indexes are data structures that allow you to efficiently query the data in your table based on one or more attributes

```python
import boto3

def lambda_handler(event, context):
    sns = boto3.client('sns')
    accountid = context.invoked_function_arn.split(":")[4]
    region = context.invoked_function_arn.split(":")[3]
    for record in event['Records']:
        message = record['dynamodb']['NewImage']
        catName = message['catName']['S']

        response = sns.publish(
            TopicArn=f'arn:aws:sns:{region}:{accountid}:Adoption-Alerts',
            Message=f"{catName} has been adopted!",
            Subject='Cat adopted!',
        )
```

This is a Python script that uses the AWS SDK (boto3) to interact with Amazon SNS (Simple Notification Service) and publish a message to a specific SNS topic when a new item is added to a DynamoDB table.

It starts by creating an SNS client using the boto3.client method, and then it extracts the account ID and region from the context.invoked_function_arn variable.

Next, it uses a for loop to iterate through the records in the event['Records'] list. For each record, it extracts the new image of the item in the DynamoDB table, and then it retrieves the value of the catName attribute.

Finally, it uses the sns.publish() method to publish a message to the specified SNS topic. The topic ARN (Amazon Resource Name) is constructed using the f-string syntax, and the message and subject of the message are also constructed using the f-string syntax. The message is the concatenation of the catName with a string " has been adopted!" and the subject is "Cat adopted!".
