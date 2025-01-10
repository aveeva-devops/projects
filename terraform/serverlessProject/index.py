import json
import boto3
import uuid
from boto3.dynamodb.conditions import Key

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('Users')

def handler(event, context):
    http_method = event['httpMethod']
    path = event['path']
    
    if path == '/users':
        if http_method == 'GET':
            return get_all_users()
        elif http_method == 'POST':
            return create_user(json.loads(event['body']))
    elif path.startswith('/users/'):
        user_id = path.split('/')[-1]
        if http_method == 'GET':
            return get_user(user_id)
        elif http_method == 'PUT':
            return update_user(user_id, json.loads(event['body']))
        elif http_method == 'DELETE':
            return delete_user(user_id)
    
    return {
        'statusCode': 400,
        'body': json.dumps('Invalid request')
    }

def get_all_users():
    response = table.scan()
    return {
        'statusCode': 200,
        'body': json.dumps(response['Items'])
    }

def create_user(user_data):
    user_id = str(uuid.uuid4())
    user_data['id'] = user_id
    table.put_item(Item=user_data)
    return {
        'statusCode': 201,
        'body': json.dumps({'id': user_id})
    }

def get_user(user_id):
    response = table.get_item(Key={'id': user_id})
    if 'Item' in response:
        return {
            'statusCode': 200,
            'body': json.dumps(response['Item'])
        }
    else:
        return {
            'statusCode': 404,
            'body': json.dumps('User not found')
        }

def update_user(user_id, user_data):
    update_expression = 'SET ' + ', '.join(f'#{k}=:{k}' for k in user_data.keys())
    expression_attribute_names = {f'#{k}': k for k in user_data.keys()}
    expression_attribute_values = {f':{k}': v for k, v in user_data.items()}
    
    try:
        table.update_item(
            Key={'id': user_id},
            UpdateExpression=update_expression,
            ExpressionAttributeNames=expression_attribute_names,
            ExpressionAttributeValues=expression_attribute_values,
            ConditionExpression='attribute_exists(id)'
        )
        return {
            'statusCode': 200,
            'body': json.dumps('User updated successfully')
        }
    except dynamodb.meta.client.exceptions.ConditionalCheckFailedException:
        return {
            'statusCode': 404,
            'body': json.dumps('User not found')
        }

def delete_user(user_id):
    try:
        table.delete_item(
            Key={'id': user_id},
            ConditionExpression='attribute_exists(id)'
        )
        return {
            'statusCode': 200,
            'body': json.dumps('User deleted successfully')
        }
    except dynamodb.meta.client.exceptions.ConditionalCheckFailedException:
        return {
            'statusCode': 404,
            'body': json.dumps('User not found')
        }
