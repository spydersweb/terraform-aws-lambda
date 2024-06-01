locals {
  archive_path   = "${path.module}/tf_generated/${local.runtime_name}.zip"
  binary_path    = "${path.module}/tf_generated"
  go_output_file = "${path.module}/tf_generated/${local.runtime_name}"
  runtime_name   = "bootstrap"
  src_path       = "${var.lambda_source_path}/${var.function_name}"
}

