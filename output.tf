output "sqs_payment_production_order_queue_arn" {
    value = aws_sqs_queue.from_payment_production_order_queue.arn
}

output "sqs_to_production_order_queue" {
    value = aws_sqs_queue.to_production_order_queue.arn
}

output "sns_update_order_status_arn" {
  value = aws_sns_topic.update_order_status.arn
}