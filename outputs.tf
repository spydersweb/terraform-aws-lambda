output "lambda_name" {
  value = aws_lambda_function.function.function_name
}

output "lambda_ids" {
  value = {
    arn = aws_lambda_function.function.arn
    id  = aws_lambda_function.function.id
  }
}