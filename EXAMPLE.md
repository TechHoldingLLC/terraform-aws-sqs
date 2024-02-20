# SQS
Below is an examples of calling this module.
 
## Create an SQS queue. 
```
module "sqs" {
  source = "./sqs"
  name   = "my-sqs"
  
  providers = {
    aws = aws
  }
}
```

## Add following attributes as required
Following values will be added, rest of the code will be same as above
```
content_based_deduplication          = true   # Add to enable Content based deduplication
fifo_queue                           = true   # Add to enable FIFO queue
dlq                                  = true   # Add to create a Dead letter queue
dlq_redrive_policy_max_receive_count = value  # Add to provide max receive count in redrive policy of Dead letter queue
```

## Configure SQS to invoke Lambda
```
module "sqs" {
  source                      = "./sqs"
  name                        = "my-sqs"
  trigger_lambda_function_arn = "lambda_function_arn"
  
  providers = {
    aws = aws
  }
}
```
