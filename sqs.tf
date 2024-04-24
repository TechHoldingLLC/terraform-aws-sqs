resource "aws_sqs_queue" "sqs_dlq" {
  count                      = var.dlq ? 1 : 0
  name                       = var.fifo_queue ? "${var.name}-dlq.fifo" : "${var.name}-dlq"
  fifo_queue                 = var.fifo_queue
  delay_seconds              = var.delay_seconds
  message_retention_seconds  = var.dlq_message_retention_seconds
  receive_wait_time_seconds  = var.receive_wait_time_seconds
  visibility_timeout_seconds = var.dlq_visibility_timeout_seconds
  sqs_managed_sse_enabled    = var.sqs_managed_sse_enabled

  tags = var.tags
}

resource "aws_sqs_queue" "sqs" {
  name                        = var.fifo_queue ? "${var.name}.fifo" : var.name
  visibility_timeout_seconds  = var.visibility_timeout_seconds
  fifo_queue                  = var.fifo_queue
  content_based_deduplication = var.content_based_deduplication
  delay_seconds               = var.delay_seconds
  message_retention_seconds   = var.message_retention_seconds
  receive_wait_time_seconds   = var.receive_wait_time_seconds
  sqs_managed_sse_enabled     = var.sqs_managed_sse_enabled

  redrive_policy = var.dlq ? jsonencode(
    {
      deadLetterTargetArn = aws_sqs_queue.sqs_dlq[0].arn
      maxReceiveCount     = var.dlq_redrive_policy_max_receive_count
    }
  ) : null

  tags = var.tags
}

resource "aws_lambda_event_source_mapping" "sqs_lambda" {
  count            = var.trigger_lambda_function ? 1 : 0
  event_source_arn = aws_sqs_queue.sqs.arn
  function_name    = var.lambda_function_arn
  batch_size       = var.batch_size

  scaling_config {
    maximum_concurrency = var.maximum_concurrency
  }
}