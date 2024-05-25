output "lambda_test_binary_path" {
  value = local.binary_path
}

output "lambda_name" {
  value = aws_lambda_function.function.function_name
}