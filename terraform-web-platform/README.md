# Terraform Web Platform

A scalable, multi-environment AWS infrastructure project using Terraform modules to deploy a web platform with Application Load Balancer, Auto Scaling Group, and RDS MySQL database.

## Architecture Overview

This project creates a production-ready web platform with the following components:

- **VPC** with public and private subnets across multiple AZs
- **Application Load Balancer (ALB)** for traffic distribution
- **Auto Scaling Group** with EC2 instances running a simple web server
- **RDS MySQL database** in private subnets for data persistence
- **Security Groups** implementing least-privilege access control

## Project Structure

```
terraform-web-platform/
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── terraform.tfvars
│   │   └── outputs.tf
│   └── prod/
│       ├── main.tf
│       ├── terraform.tfvars
│       └── outputs.tf
├── modules/
│   ├── networking/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── compute/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── user_data.sh
│   └── database/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── .gitignore
└── README.md
```

## Prerequisites

Before deploying this infrastructure, ensure you have:

1. **Terraform CLI** installed (version 0.14 or later)
2. **AWS CLI** configured with appropriate credentials
3. An AWS account with permissions to create VPCs, EC2 instances, RDS databases, and ALBs

## Quick Start

### 1. Clone and Setup

```bash
# Create project structure
mkdir -p terraform-web-platform/{environments/{dev,prod},modules/{networking,compute,database}}

# Create all necessary files
touch terraform-web-platform/environments/dev/{main.tf,terraform.tfvars,outputs.tf}
touch terraform-web-platform/environments/prod/{main.tf,terraform.tfvars,outputs.tf}
touch terraform-web-platform/modules/networking/{main.tf,variables.tf,outputs.tf}
touch terraform-web-platform/modules/compute/{main.tf,variables.tf,outputs.tf}
touch terraform-web-platform/modules/database/{main.tf,variables.tf,outputs.tf}
```

### 2. Configure AWS Credentials

```bash
export AWS_ACCESS_KEY_ID="YOUR_AWS_ACCESS_KEY"
export AWS_SECRET_ACCESS_KEY="YOUR_AWS_SECRET_KEY"
export AWS_REGION="us-east-1"
```

### 3. Deploy Development Environment

```bash
cd terraform-web-platform/environments/dev

# Initialize Terraform
terraform init

# Validate configuration
terraform validate

# Preview changes
terraform plan

# Deploy infrastructure
terraform apply
```

### 4. Test Your Deployment

After deployment completes, Terraform will output the ALB DNS name. Visit this URL in your browser to see your web application running.

## Module Details

### Networking Module
- Creates VPC with configurable CIDR blocks
- Sets up public and private subnets across multiple AZs
- Configures Internet Gateway and NAT Gateway
- Implements security groups for ALB, web servers, and database

### Compute Module
- Deploys Application Load Balancer in public subnets
- Creates Launch Template with Amazon Linux 2 AMI
- Sets up Auto Scaling Group with configurable scaling policies
- Installs simple Apache web server via user data script

### Database Module
- Provisions RDS MySQL instance in private subnets
- Creates DB subnet group for multi-AZ deployment
- Configures security group allowing access only from web servers

## Configuration

### Development Environment Variables

Located in `environments/dev/terraform.tfvars`:

```hcl
# General
aws_region  = "us-east-1"
environment = "dev"

# Networking
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24"]

# Database
db_instance_class = "db.t3.micro"
db_username       = "devadmin"
db_password       = "devPassword123"

# Compute
instance_type = "t2.micro"
asg_min_size  = 1
asg_max_size  = 2
```

### Production Considerations

For production deployments, consider:
- Larger instance classes (`db.t3.small`, `t3.small`)
- Enable Multi-AZ for RDS (`multi_az = true`)
- Use AWS Secrets Manager for database credentials
- Enable final snapshot for RDS (`skip_final_snapshot = false`)
- Increase Auto Scaling Group capacity

## Security Features

- **Network Segmentation**: Web servers in private subnets, ALB in public subnets
- **Security Groups**: Restrictive ingress/egress rules following least-privilege principle
- **Database Security**: RDS accessible only from web server security group
- **NAT Gateway**: Enables secure outbound internet access for private instances

## Scaling & High Availability

- **Auto Scaling**: Automatically adjusts capacity based on CPU utilization (50% threshold)
- **Multi-AZ Deployment**: Resources distributed across multiple availability zones
- **Load Balancing**: ALB distributes traffic across healthy instances
- **Health Checks**: Automatic replacement of unhealthy instances

## Cleanup

To avoid AWS charges, destroy the infrastructure when finished:

```bash
cd terraform-web-platform/environments/dev
terraform destroy
```

⚠️ **Warning**: This will permanently delete all resources. Ensure you have backups of any important data.

## Troubleshooting

### Common Issues

1. **"Backend initialization required"**: Run `terraform init` in the environment directory
2. **Access denied errors**: Verify AWS credentials and IAM permissions
3. **Resource already exists**: Check for naming conflicts or existing resources
4. **Timeout during apply**: Large deployments may take 10-15 minutes

### Useful Commands

```bash
# View current state
terraform show

# List all resources
terraform state list

# Get specific resource details
terraform state show aws_instance.example

# Refresh state from AWS
terraform refresh
```

## Contributing

1. Follow Terraform best practices
2. Use meaningful resource names and tags
3. Include appropriate variable descriptions
4. Test changes in development environment first
