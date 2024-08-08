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

resource "aws_sqs_queue" "order_status_updated_queue" {
  name                        = "order_status_updated-queue"
  content_based_deduplication = true
  tags = { 
    "terraform" = "true"
    "client_1" = "production"
  }
}

resource "aws_sqs_queue" "order_payment_status_updated_queue" {
  name                        = "order_payment_status_updated-queue"
  content_based_deduplication = true
  tags = { 
    "terraform" = "true"
    "client_1" = "production"
  }
}

resource "aws_sqs_queue" "production_order_created_queue" {
  name                        = "production_order_created-queue"
  content_based_deduplication = true
  tags = { 
    "terraform" = "true"
    "client_1" = "production"
  }
}
