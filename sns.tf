resource "aws_sns_topic" "update_order_status" {
  name = "update_order_status-topic"
}

resource "aws_sns_topic_subscription" "sub_sqs_payment_production_queue" {
  topic_arn = aws_sns_topic.update_order_status.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.from_payment_production_order_queue.arn
}

resource "aws_sns_topic" "order_created" {
  name = "order_created-topic"
}

resource "aws_sns_topic" "payment_status_updated" {
  name = "payment_status_updated-topic"
}

resource "aws_sns_topic" "production_failed" {
  name = "production_failed-topic"
}

resource "aws_sns_topic" "order_status_updated" {
  name = "order_status_updated-topic"
}

resource "aws_sns_topic_subscription" "sub_sqs_order_status_updated_queue" {
  topic_arn = aws_sns_topic.order_status_updated.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.order_status_updated_queue.arn
}

resource "aws_sns_topic_subscription" "sub_sqs_order_payment_status_updated_queue" {
  topic_arn = aws_sns_topic.payment_status_updated.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.order_payment_status_updated_queue.arn
}

resource "aws_sns_topic_subscription" "sub_sqs_production_order_created_queue" {
  topic_arn = aws_sns_topic.order_created.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.production_order_created_queue.arn
}
