import os, boto3

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table(os.environ['TABLE_NAME'])

def lambda_handler(event, context):
    short_code = event['pathParameters']['shortid']
    response = table.get_item(Key={"short_code": short_code})

    if 'Item' not in response:
        return {"statusCode": 404, "body": "URL not found"}

    return {
        "statusCode": 301,
        "headers": {"Location": response['Item']['original_url']}
    }