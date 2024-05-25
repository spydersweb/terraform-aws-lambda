# Use this variable to determine if the Go binary and 
# deployment package should be built.
variable "build_go_binary" {
  description = "Boolean to determine if the Go binary should be build and zipped"
  type = bool
  default = false
}

variable "function_description" {
  type = string
  description = "The description of the function"

  validation {
    condition = length(var.function_description)>0
    error_message = "The description cannot be an empty value and must be descriptive of the lambda function"
  }
}

variable "function_name" {
  type = string
  description = "name of the function"

  validation {
    condition = length(var.function_name)>4
    error_message = "The function name must be longer than 4 characters long"
  }
}

variable "function_tags" {
  type = map(string)
  description = "The tags to assign to the lambda"

  default = {}
} 

variable "handler" {
  type = string
  description = "The function handler of the lambda function"

  validation {
    condition = length(var.handler)>0
    error_message = "The handler is the function entry point and cannot be empty"
  }

  default = "handleRequest"
}

variable "memory_size" {
  type = number
  description = "The memory size to allocate to the lambda function"

  default = 128
}


variable "runtime" {
  type = string
  description = "The runtime used for the lambda function"

  # Defaulting to the Go 2 runtime
  default = "provided.al2"

  validation {
    condition = contains(
      [
        "nodejs",
        "nodejs4.3",
        "nodejs6.10",
        "nodejs8.10",
        "nodejs10.x",
        "nodejs12.x",
        "nodejs14.x",
        "nodejs16.x",
        "java8",
        "java8.al2",
        "java11",
        "python2.7",
        "python3.6",
        "python3.7",
        "python3.8",
        "python3.9",
        "dotnetcore1.0",
        "dotnetcore2.0",
        "dotnetcore2.1",
        "dotnetcore3.1",
        "dotnet6",
        "dotnet8",
        "nodejs4.3-edge",
        "go1.x",
        "ruby2.5",
        "ruby2.7",
        "provided",
        "provided.al2",
        "nodejs18.x",
        "python3.10",
        "java17",
        "ruby3.2",
        "python3.11",
        "nodejs20.x",
        "provided.al2023",
        "python3.12",
        "java21"
      ], var.runtime
    )
    error_message = "The provided runtime is not an acceptable lambda runtime value"
  }
}

variable timeout {
  type= number

  description = "The amount of time for the lambda to run, defaults to 30 seconds"

  default = 30
}