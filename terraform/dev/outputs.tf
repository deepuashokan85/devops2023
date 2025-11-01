output "vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.demovpc.id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the created VPC"
  value       = aws_vpc.demovpc.cidr_block
}

output "vpc_arn" {
  description = "The ARN of the created VPC"
  value       = aws_vpc.demovpc.arn
}

output "vpc_tags" {
  description = "The tags assigned to the VPC"
  value       = aws_vpc.demovpc.tags
}

