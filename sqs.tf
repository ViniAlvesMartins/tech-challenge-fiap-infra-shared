resource "aws_sqs_queue" "from_payment_production_order_queue" {
  name                        = "from_payment_production_order_queue"
  tags = { 
    "terraform" = "true"
    "client_1" = "payment"
    "client_2" = "production"
  }
}

resource "aws_sqs_queue" "to_production_order_queue" {
  name                        = "to_production_order_queue.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
  tags = { 
    "terraform" = "true"
    "client_1" = "production"
  }
}