# Mini Project - Setting Up Secure Authentication to AWS API

Following the reqirement detailed in the previous project, the initial step in crafting our script is to ensure we have the necessary AWS account setup for authentication and resource management in the cloud. This setup is crucial for enabling the script to create EC2 instances and S3 buckets efficiently. Here's how to proceed:

- showing of IAM role dashboard, only four roles previously created.

![](./Images/1.%20IAM-roles.png)

- showing the list of my file

![](./Images/3.%20list%20of%20files.png)

1. **Create an IAM Role**: Begin by by establishing an IAM role that encapsulates the permissions required for the operations our script will perform.

2. **Create an IAM Policy**: Design an IAM policy granting full access to both EC2 and S3 services. This policy ensures our script has the necessary permissions to manage these resources.

3. **Create an IAM User**: Instantiate an IAM user named automation_user. This user will serve as the primary entity our script uses to interact with AWS services.

4. **Assign the User to the IAM Role**: Link the automation_user to the previously created IAM role to inherit its permissions. This step is vital for enabling the necessary access levels for our automation tasks.

5. **Attach the IAM Policy to the User**: Ensure that the automation_user is explicitly granted the permissions defined in our IAM policy by attaching the policy directly to the user. This attachment solidifies the user's access to EC2 and S3 resources.

6. **Create programatic Access Credentials**: Generate programmatic access credentials - specifically, an access key ID and a secret access key for automation_user. These credentials are indispensable for authenticating our script with the AWS API through the Linux terminal, allowing it to create and manage cloud resources programmatically.

- creating the IAM policy, User, the role and others listed

![](./Images/4.%20setup-IAM.png)

- attaching policy to role

![](./Images/5.%20install-yjq.png)

- installing jq tool to extract the access key and secret access key using this command 

``` bash
sudo apt update && sudo apt install -y jq
```

- view the `json file` and `configure` the profile

![](./Images/6.%20credential-json.png)


- IAM User created

![](./Images/7.%20user-created-inAWS.png)


- IAM EC2 and S3 Automation Role created

![](./Images/8.%20role-createdAWS.png)


- Role Policy attached to User

![](./Images/9.%20roles-permission.png)


- IAM EC2 and S3 Full Access

![](./Images/10.%20full-access.png)



## Installing and Configuring the AWS CLI

After setting up your AWS account and creating the necessary IAM user and permissions, the next step involves installing the AWS Command Line Interface (CLI). The AWS CLI is a powerful tool that allows you to interact with AWS services directly from your terminal, enabling automation and simplification of AWS resource management.

# Downloading and Installing AWS CLI

## On Linux

1. Download the AWS CLI version 2 installation file for Linux

``` bash 
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
```

2. Unzip the installer

``` bash
unzip awscliv2.zip
```

3. Run the installer

``` bash 
sudo ./aws/install
```

![](./Images/2.%20aws--version.png)


# Configuring the AWS CLI

Once the AWS CLI is installed, the next step is to configure it to use the access key ID and secret access key generated for your automation_user. This will authenticate your CLI requests to the AWS API.

## Understanding APIs

Before proceeding further, it's essential to understand what an API (Application Programming Interface) is and its relevance here. An API is a set of protocols and tools that allows different software applications to communicate with each other. In the context of AWS, the AWS API enables your scripts or the AWS CLI to interact with AWS services programmatically. This means you can create, modify, and delete AWS resources by making API calls, which are just structured requests that the AWS platform can understand and act upon.

### Configurating AWS CLI for access to AWS:

Open your terminal or Command Promt and enter

``` bash 
aws configure
```

This command initiates the setup process for your AWS CLI installation.

### Enter your Credentials:

When prompted, enter the **AWS Access Key ID and AWS Secret Access Key** for the automation_user. Ensure these are kept secure and are not shared.

![](./Images/10a.%20AWS-Config.png)


Next, specify the default **region** name and default **output** format. 
The region should match the one you plan to deploy resources in, and a common output format is **json**.


## Testing the Configuration:

To verify that your AWS CLI is configured correctly and can communicate with AWS services, try running a basic command to list all the AWS regions:


``` bash
aws ec2 describe-regions --output table
```

This command queries the EC2 service for a list of all regins and formats that output as a table, which makes it easy to read. you will receive a list of regions.


![](./Images/11.%20table.png)

