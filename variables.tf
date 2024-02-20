variable "content_based_deduplication" {
  description = "Content based deduplication"
  default     = false
}

variable "fifo_queue" {
  description = "Enable FIFO"
  default     = false
}

variable "name" {
  description = "Name of SNS and SQS"
}

variable "trigger_lambda_function_arn" {
  description = "Lambda function arn that trigger from SQS"
  default     = ""
}

variable "visibility_timeout_seconds" {
  description = "Msg visibility timeout"
  default     = 30
}

variable "dlq" {
  description = "Enable DLQ"
  default     = false
}

variable "dlq_redrive_policy_max_receive_count" {
  description = "DLQ redrive policy max receive count"
  default     = 5
}
