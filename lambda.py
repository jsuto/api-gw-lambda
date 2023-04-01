def get_unique_chars(s):
    if s:
        a = [x for x in list(set(*[s])) if x.isalpha()]
        return ','.join(a) + "\n"
    else:
        return "ERROR: empty string\n"

def lambda_handler(event, context):
    if 'queryStringParameters' in event and 'aaa' in event['queryStringParameters']:
        result = get_unique_chars(event['queryStringParameters']['aaa'])
    else:
        result = "USAGE: https://....?aaa=<yourstring>"

    return {
        'statusCode': 200,
        'body': result
    }
