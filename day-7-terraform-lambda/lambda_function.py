import json
import boto3

def lambda_handler(event, context):
  client = boto3.client('ec2')
  response = client.run_instances(
    ImageId= 'ami-05c179eced2eb9b5b',
    InstanceType='t2.micro',
    KeyName='mumbai',
    MaxCount=1,
    MinCount=1
)