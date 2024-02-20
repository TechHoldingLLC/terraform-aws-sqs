output "arn" {
  value = aws_sqs_queue.sqs.arn
}

output "id" {
  value = aws_sqs_queue.sqs.id
}

output "url" {
  value = aws_sqs_queue.sqs.id
}

output "name" {
  value = aws_sqs_queue.sqs.name
}

output "dlq_name" {
  value = var.dlq ? aws_sqs_queue.sqs_dlq[0].name : ""
}