variable "tags" {
  description = "Tag"
  default     = {}
}

variable "sqs_managed_sse_enabled" {
  description = "Server side encryption"
  default     = true
}

variable "delay_seconds" {
  description = "The duration for which the message will be delayed before it can be consumed after being added to the queue"
  type        = number
  default     = 0
}

variable "message_retention_seconds" {
  description = "The duration for which a message will be retained in the queue"
  type        = number
  default     = 86400
}

variable "receive_wait_time_seconds" {
  description = "The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning"
  type        = number
  default     = 0
}

variable "dlq_message_retention_seconds" {
  description = "The duration for which a message won't be available for another consumer (So if a message processing fails, this is a time it will take for it to be consumed again)"
  type        = number
  default     = 1209600
}

variable "dlq_visibility_timeout_seconds" {
  description = "The duration for which a message will be retained in the queue"
  type        = number
  default     = 30
}

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

variable "trigger_lambda_function" {
  description = "Lambda function arn that trigger from SQS"
  default     = false
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

variable "batch_size" {
  description = "The largest number of records that Lambda will retrieve from event source at the time of invocation"
  default     = 10
}

variable "maximum_concurrency" {
  description = "Limits the number of concurrent instances that the Amazon SQS event source can invoke"
  default     = 10
}

variable "lambda_function_arn" {
  description = "Lambda function arn"
  type        = string
  default     = ""
}

variable "deduplication_scope" {
  description = "Specifies whether message deduplication occurs at the message group or queue level"
  type        = string
  default     = "queue"
}
