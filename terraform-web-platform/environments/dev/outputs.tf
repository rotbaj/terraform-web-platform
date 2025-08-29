output "alb_dns_name" {
  description = "The public DNS name of the dev ALB."
  value       = module.compute.alb_dns_name
}