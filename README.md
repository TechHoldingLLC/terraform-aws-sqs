## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.5 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_lambda_event_source_mapping.sqs_lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_event_source_mapping) | resource |
| [aws_sqs_queue.sqs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue.sqs_dlq](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_batch_size"></a> [batch\_size](#input\_batch\_size) | The largest number of records that Lambda will retrieve from event source at the time of invocation | `number` | `10` | no |
| <a name="input_content_based_deduplication"></a> [content\_based\_deduplication](#input\_content\_based\_deduplication) | Content based deduplication | `bool` | `false` | no |
| <a name="input_dlq"></a> [dlq](#input\_dlq) | Enable DLQ | `bool` | `false` | no |
| <a name="input_dlq_redrive_policy_max_receive_count"></a> [dlq\_redrive\_policy\_max\_receive\_count](#input\_dlq\_redrive\_policy\_max\_receive\_count) | DLQ redrive policy max receive count | `number` | `5` | no |
| <a name="input_fifo_queue"></a> [fifo\_queue](#input\_fifo\_queue) | Enable FIFO | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of SNS and SQS | `any` | n/a | yes |
| <a name="input_trigger_lambda_function_arn"></a> [trigger\_lambda\_function\_arn](#input\_trigger\_lambda\_function\_arn) | Lambda function arn that trigger from SQS | `string` | `""` | no |
| <a name="input_visibility_timeout_seconds"></a> [visibility\_timeout\_seconds](#input\_visibility\_timeout\_seconds) | Msg visibility timeout | `number` | `30` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
| <a name="output_dlq_name"></a> [dlq\_name](#output\_dlq\_name) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_url"></a> [url](#output\_url) | n/a |

## License

Apache 2 Licensed. See [LICENSE](https://github.com/TechHoldingLLC/terraform-aws-sqs/blob/main/LICENSE) for full details.