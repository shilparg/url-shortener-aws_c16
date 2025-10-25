import json, os, boto3, hashlib, base64

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table(os.environ['TABLE_NAME'])

def lambda_handler(event, context):
    body = json.loads(event['body'])
    original_url = body.get('url')

    if not original_url:
        return {"statusCode": 400, "body": json.dumps({"error": "Missing URL"})}

    short_code = base64.urlsafe_b64encode(hashlib.md5(original_url.encode()).digest())[:6].decode()
    table.put_item(Item={"short_code": short_code, "original_url": original_url})

    return {
        "statusCode": 200,
        "body": json.dumps({"short_url": f"https://{os.environ['DOMAIN']}/{short_code}"})
    }