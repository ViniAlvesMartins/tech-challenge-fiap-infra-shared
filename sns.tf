resource "aws_sns_topic" "update_order_status" {
  name = "update_order_status-topic"
}

resource "aws_sns_topic_subscription" "sub_sqs_payment_production_queue" {
  topic_arn = aws_sns_topic.update_order_status.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.from_payment_production_order_queue.arn
}