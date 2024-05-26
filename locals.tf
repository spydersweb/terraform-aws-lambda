locals {
  archive_path   = "${path.module}/tf_generated/${local.runtime_name}.zip"
  binary_path    = "${path.module}/tf_generated" #${path.module}/tf_generated/bootstrap
  go_output_file = "${path.module}/tf_generated/${local.runtime_name}"
  runtime_name   = "bootstrap"
  src_path       = "github.com/spydersweb/aws/lambda/${var.function_name}"
}

