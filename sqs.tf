resource "aws_sqs_queue" "sqs_dlq" {
  count             = var.dlq ? 1 : 0
  name              = var.fifo_queue ? "${var.name}-dlq.fifo" : "${var.name}-dlq"
  fifo_queue        = var.fifo_queue
}

resource "aws_sqs_queue" "sqs" {
  name                        = var.fifo_queue ? "${var.name}.fifo" : var.name
  visibility_timeout_seconds  = var.visibility_timeout_seconds
  fifo_queue                  = var.fifo_queue
  content_based_deduplication = var.content_based_deduplication
  redrive_policy = var.dlq ? jsonencode(
    {
      deadLetterTargetArn = aws_sqs_queue.sqs_dlq[0].arn
      maxReceiveCount     = var.dlq_redrive_policy_max_receive_count
    }
  ) : null
}

resource "aws_lambda_event_source_mapping" "sqs_lambda" {
  count            = var.trigger_lambda_function_arn != "" ? 1 : 0
  event_source_arn = aws_sqs_queue.sqs.arn
  function_name    = var.trigger_lambda_function_arn
  batch_size       = var.batch_size
}