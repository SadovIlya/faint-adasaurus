output "alb_dns_name" {
  value       = aws_lb.example.dns_name
  description = "The domain name of the load balancer"
}

output "alb_dns_zone_id" {
  value = aws_lb.example.zone_id
}

output "alb_arn" {
  value = aws_lb.example.arn
}

output "alb_security_group_id" {
  value = aws_security_group.alb.id
}