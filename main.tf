# Null resource to build the go binary
resource "null_resource" "go_function_binary" {
  count = var.build_go_binary ? 1 : 0
  provisioner "local-exec" {
    command = "GOOS=linux GOARCH=amd64 CGO_ENABLED=0 GOFLAGS=-trimpath go build -mod=readonly -ldflags='-s -w' -o ${local.go_output_file} ${local.src_path}"
  }
}

# Archive file resource to zip the created binary
data "archive_file" "go_function_archive" {
  count = var.build_go_binary ? 1 : 0

  depends_on = [null_resource.go_function_binary]

  type        = "zip"
  source_file = "${local.go_output_file}"
  output_path = local.archive_path
}

resource "aws_lambda_function" "function" {
  function_name = var.function_name
  description   = var.function_description
  role          = aws_iam_role.lambda.arn
  handler       = local.binary_path
  memory_size   = var.memory_size

  filename         = local.archive_path
  source_code_hash = data.archive_file.function_archive.output_base64sha256

  runtime = var.runtime

  timeout = var.timeout

  tags = var.function_tags
}

# Cloudwatch logging group
resource "aws_cloudwatch_log_group" "log_group" {
  name              = "/aws/lambda/${aws_lambda_function.function.function_name}"
  retention_in_days = 7
}