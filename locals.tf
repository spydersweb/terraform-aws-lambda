locals {
  src_path = "github.com/spydersweb/aws/lambda/${var.function_name}"

  runtime_name = "bootstap"
  binary_name  = "bootstrap" #var.function_name
  binary_path  = "${path.module}/tf_generated"
  archive_path = "${path.module}/tf_generated/${var.function_name}.zip"
}

