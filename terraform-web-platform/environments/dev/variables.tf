variable "aws_region" {
  description = "The AWS region for the environment."
  type        = string
}

variable "environment" {
  description = "The name of the environment (e.g., dev, prod)."
  type        = string
}

# --- Networking ---
variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

# --- Database ---
variable "db_instance_class" {
  type = string
}

variable "db_username" {
  type      = string
  sensitive = true
}

variable "db_password" {
  type      = string
  sensitive = true
}

# --- Compute ---
variable "instance_type" {
  type = string
}

variable "asg_min_size" {
  type = number
}

variable "asg_max_size" {
  type = number
}