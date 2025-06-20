# Mini Project: Configuring Auto Scaling with ALB using Launch Template

In this mini project, you will learn how to configure Auto Scaling in AWS with an Application Load Balancer (ALB) using a Launch Template. The project aims to demonstrate the automatic scaling of EC2 instances based on demand, while leveraging the benefits of a Launch Template.

## Objectives:
### Create Launch Template:

- Learn how to create a Lauch Template with the required specifications

### Set Up Auto Scaling Group:

- Configure an Auto Scaling group to manage the desired number of EC2 instances using the Launch Template.

### Configure Scaling Policies:

- Set up scaling policies to adjust the number of instances based on demand.

### Attach ALB to Autoscaling Group: 

- Connect the Auto Scaling group to an existing ALB

### Test Auto Scaling:

- Verify that the Auto Scaling group adjusts the number of instances in response to changes in demand

## Create Launch Template

- Log in to the AWS Management Console

![](./Images/1-EC2-navigation.png)

- Navigate to the EC2 service
- In the left panel, clcik on Lunch Template
- click create template

![](./Images/2-launch-%20template.png)

- Configure the Launch Template setting, include the AMI, Instance type, and user data

![](./Images/4-LTname-description.png)

- Linux AMI Included

![](./Images/5-LinuxAMI-included.png)

- t2.micro instance type and keypair added

![](./Images/6-instanceType-keypair.png)

- select security group
- click on create Launch Template

![](./Images/7-securityG-createLT.png)

- LT Created successfully

![](./Images/8-LT-SuccessfullyCreated.png)

## Setup Auto Scaling Group

- In the AWS console, navigate to the EC2

![](./Images/9-EC2-autoscaling.png)


- Click on Auto Scaling Group (ASG)

![](./Images/10-create-ASG.png)

- provide the ASG informations
- click next

![](./Images/11.%20ASG-1.png)


- Choose and existing VPC and Subnets

![](./Images/12.%20ASG-2.png)

-  ASG

![](./Images/13.%20ASG-3.png)


- click next

![](./Images/13a.%20default.png)


- skip to review

![](./Images/14.%20skip-2-review.png)


- reviwe for errors

![](./Images/15.%20review-1.png)


- review for error2

![](./Images/15b.%20review-2.png)

continue review

![](./Images/15c.%20review-3.png)


- Successfully created ASG

![](./Images/16.%20ASG-Createdsuccessful.png)


- Instance launched successfully

![](./Images/17.%20instance-launched-successful.png)


## Configure Scaling Policy

- In the Auto scaling group configuration, navigate to the "scaling policy section"

![](./Images/18.%20automatic-scaling.png)


- click on create scaling policy
- click on next

![](./Images/19.%20autoscalingpolicy.png)


- Configure policy for scaling in and out
- successfully created scaling policy

![](./Images/20.%20created-successfully.png)


## Attch ALB to Auto Scaling Group

- in the auto scaling group, navigate to the Load Balancer
- create load balancer

![](./Images/21.%20create-LB.png)


- Select the ALB to associate with the Auto Scaling Group

![](./Images/22.%20create-ALB.png)


- choose a load balancer name 

![](./Images/23a.%20ALB-1.png
)

- network mapping, choose your VPC
- select your AZ ad subnet

![](./Images/24.%20VPC-subnet123.png)


- target group
- choose a target type
- click on next

![](./Images/26b.%20next.png)


- Load balanacer created successfully

![](./Images/27.%20loadbalancer-success.png)

- choose your load balance

![](./Images/28.%20editASG.png
)


- ASG updated successfully

![](./Images/29.%20updatesSuccess.png
)


## Test Auto Scaling
 - Generate traffic to trigger scaling policy
 - connect to EC2 instance and run this command.


 ``` bash 
         sudo amazon-linux-extras install epel -y
        sudo yum install stress -y

        stress -c 4 

```

- Monitor the auto scaling group and verify that the number of instances adjust based on demand.

- paste dns of application load balance on browser.

![](./Images/30.%20DNS.png)

