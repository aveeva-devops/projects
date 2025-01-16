import json
import yaml
import boto3
import os

# Initialize AWS S3 client
s3_client = boto3.client('s3')

def handler(event, context):
    # Source and destination buckets
    source_bucket = os.environ['BUCKET_NAME']
    destination_bucket = os.environ['DEST_BUCKET_NAME']
    
    for record in event['Records']:
        # Get the file key from the event
        key = record['s3']['object']['key']
        
        # Download the YAML file from the source bucket
        download_path = f'/tmp/{key}'
        s3_client.download_file(source_bucket, key, download_path)
        
        # Convert YAML to JSON
        with open(download_path, 'r') as yaml_file:
            yaml_data = yaml.safe_load(yaml_file)
        json_data = json.dumps(yaml_data, indent=4)
        
        # Save the JSON to a temporary file
        json_file_path = f'/tmp/{key}.json'
        with open(json_file_path, 'w') as json_file:
            json_file.write(json_data)
        
        # Upload the JSON file to the destination bucket
        destination_key = f'{key}.json'
        s3_client.upload_file(json_file_path, destination_bucket, destination_key)
        print(f"Converted and uploaded {key} to {destination_bucket}/{destination_key}")

    return {
        'statusCode': 200,
        'body': json.dumps('YAML to JSON conversion completed successfully!')
    }
