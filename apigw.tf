## https://advancedweb.hu/how-to-use-the-aws-apigatewayv2-api-to-add-an-http-api-to-a-lambda-function/

resource "aws_apigatewayv2_api" "api" {
  name          = "my http api"
  description   = "App returns the unique alphanumeric characters from query string"
  protocol_type = "HTTP"
  target        = aws_lambda_function.lambda.arn
}

resource "aws_lambda_permission" "apigw" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.arn
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.api.execution_arn}/*/*"
}

output "endpoint" { value = aws_apigatewayv2_api.api.api_endpoint }
