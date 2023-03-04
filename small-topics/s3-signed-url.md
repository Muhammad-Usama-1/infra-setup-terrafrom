First make sure you have configures AWS secret in CLI

```python
import boto3
#  use this if you have already configure aws secret
# s3 = boto3.client('s3', endpoint_url='https://s3.me-south-1.amazonaws.com')
s3 = boto3.client(
    's3',
    endpoint_url='https://s3.ue-east-1.amazonaws.com',
    aws_access_key_id='YOUR_ACCESS_KEY',
    aws_secret_access_key='YOUR_SECRET_KEY'
)
bucket_name = 'your-bucket-name'
object_key = 'your-object-key'
url = s3.generate_presigned_url(
    'get_object',
    Params={'Bucket': bucket_name, 'Key': object_key},
    ExpiresIn=3600  # The URL will expire in one hour (3600 seconds)
)
print(url)

```
