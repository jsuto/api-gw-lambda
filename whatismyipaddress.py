def lambda_handler(event, context):
    return {
        'statusCode': 200,
        'body': str(event['requestContext']['http']['sourceIp']) + "\n"
    }
