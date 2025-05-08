# Working with Functions 

### Functions

Organizing your code is key to maintaining clarity and efficiency. One powerful technique for achieving this is through the use of functions.

By encapsulating specific logic within functions, you can streamline your scripts and improve readability, Going forward, you will be creating functions for every piece of requirement you wish to satisfy.

Lets consider the following logic and encapsulate them in functions

1. Check if script has an argument

2. Check if AWS CLI is installed

3. Check if environment variable exists to authenticate to AWS.

To create a function in a shell script, you simply have to defind it using this syntax.

``` bash
function_name() {"\n    # Function body\n    # You can place any commands or logic here\n"}
```
Here is a break down of the syntax.

**function_name:** This is the name of your function. Choose a descriptive name that reflects the purpose of the function.

**():** Parentheses are used to define the function. They can be omitted in simpler 'cases, but it's good practice to include them for clarity.

`:` Curly braces enclose the body of the function, where you define the commands or logic that the function will execute.

### Function: Check if script has an argument

Lets take the use this code below and encapsulate it in a function.

Here is the code below without a function.

``` bash
#!/bin/bash

# Checking the number of arguments
if [ "$#" -ne 0 ]; then
    echo "Usage: $0 <environment>"
    exit 1
fi

# Accessing the first argument
ENVIRONMENT=$1

# Acting based on the argument value
if [ "$ENVIRONMENT" == "local" ]; then
  echo "Running script for Local Environment..."
elif [ "$ENVIRONMENT" == "testing" ]; then
  echo "Running script for Testing Environment..."
elif [ "$ENVIRONMENT" == "production" ]; then
  echo "Running script for Production Environment..."
else
  echo "Invalid environment specified. Please use 'local', 'testing', or 'production'."
  exit 2
fi
```

It will look like this with a function called **check_num_of_args**

``` bash
#!/bin/bash

check_num_of_args() {"\n# Checking the number of arguments\nif [ \"$#\" -ne 0 ]; then\n    echo \"Usage: $0 <environment>\"\n    exit 1\nfi\n"}

# Accessing the first argument
ENVIRONMENT=$1

# Acting based on the argument value
if [ "$ENVIRONMENT" == "local" ]; then
  echo "Running script for Local Environment..."
elif [ "$ENVIRONMENT" == "testing" ]; then
  echo "Running script for Testing Environment..."
elif [ "$ENVIRONMENT" == "production" ]; then
  echo "Running script for Production Environment..."
else
  echo "Invalid environment specified. Please use 'local', 'testing', or 'production'."
  exit 2
fi
```


- Function to handle environment

``` bash
#!/bin/bash

# Function to check the number of arguments
check_num_of_args() {
  if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <environment>"
    exit 1
  fi
}

# Function to handle environment logic
handle_environment() {
  local env="$1"
  case "$env" in
    local)
      echo "Running script for Local Environment..."
      # Add local-specific tasks here
      ;;
    testing)
      echo "Running script for Testing Environment..."
      # Add testing-specific tasks here
      ;;
    staging)
      echo "Running script for Staging Environment..."
      # Add staging-specific tasks here
      ;;
    production)
      echo "Running script for Production Environment..."
      # Add production-specific tasks here
      ;;
    *)
      echo "Invalid environment specified. Please use 'local', 'testing', 'staging', or 'production'."
      exit 2
      ;;
  esac
}

# Main execution flow
check_num_of_args "$@"
ENVIRONMENT=$1
handle_environment "$ENVIRONMENT"
```

When a function is defined in a shell script, it remains inactive until it is invoked or called within the script. To execute the code within the function, you must place a call to the function in a relevant part of your script.

It's crucial to consider the order in which the interpreter evaluates each line of code. Placing the function where it logically fits within the flow of your script ensures that it is available and ready to be executed when needed. This organization helps maintain the readability and coherence of your script, making it easier to understand and debug.

Lets see what that would now look like;


``` bash
#!/bin/bash

# Set environment variable from first argument
ENVIRONMENT=$1

# Function to check the number of arguments
check_num_of_args() {
  if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <environment>"
    exit 1
  fi
}

# Function to handle environment logic
handle_environment() {
  local env="$1"
  case "$env" in
    local)
      echo "Running script for Local Environment..."
      # Add local-specific tasks here
      ;;
    testing)
      echo "Running script for Testing Environment..."
      # Add testing-specific tasks here
      ;;
    staging)
      echo "Running script for Staging Environment..."
      # Add staging-specific tasks here
      ;;
    production)
      echo "Running script for Production Environment..."
      # Add production-specific tasks here
      ;;
    *)
      echo "Invalid environment specified. Please use 'local', 'testing', 'staging', or 'production'."
      exit 2
      ;;
  esac
}

# Function calls
check_num_of_args "$@"
handle_environment "$ENVIRONMENT"
```

With a refactored version of the code, we now have the flow like this;

1. Environment variable moved to the top

2. Function defined

3. Function call

4. Activate based on infrastructure environment section.

What can also be done is encapsulate number 4 in a function and call all the functions at the end of the script. This is what you would see most times in the real world.

Lets see what that would now look like:

``` bash
#!/bin/bash

# Set environment variable from first argument
ENVIRONMENT=$1

# Function to check the number of arguments
check_num_of_args() {
  if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <environment>"
    exit 1
  fi
}

# Function to handle environment logic
handle_environment() {
  local env="$1"
  case "$env" in
    local)
      echo "Running script for Local Environment..."
      # Add local-specific tasks here
      ;;
    testing)
      echo "Running script for Testing Environment..."
      # Add testing-specific tasks here
      ;;
    staging)
      echo "Running script for Staging Environment..."
      # Add staging-specific tasks here
      ;;
    production)
      echo "Running script for Production Environment..."
      # Add production-specific tasks here
      ;;
    *)
      echo "Invalid environment specified. Please use 'local', 'testing', 'staging', or 'production'."
      exit 2
      ;;
  esac
}

# Function to activate environment based on infrastructure
activate_environment() {
  check_num_of_args "$@"
  handle_environment "$ENVIRONMENT"
}

# Final function call
activate_environment "$@"
```

With this updated version of the code, you can now see how clean the code looks. You can easily undestand what each function is doing based on its name, comments and the order in which the functions are called at the end.


 ## Check if AWS CLI is installed

 ``` bash
 #!/bin/bash

# Function to check if AWS CLI is installed
check_aws_cli() {"\n    if ! command -v aws &> /dev/null; then\n        echo \"AWS CLI is not installed. Please install it before proceeding.\"\n        return 1\n    fi\n"}
```

- break down this section of the code;

`if ! command -v aws &>/dev/null;` then: This line contains an if statement. Here's the breakdown:

`!:` This is the logical negation operator. It reverses the result of a command, so `!`command means "if Not".

`command -v aws:` This command checks if the aws command is available in the system. It returns the path to the aws executable if it exists, or nothing if it doesn't. if you run this on your system, it will tell you the path to the 'aws' cli.

``` bash
#Example: 

check_aws_cli() uses command -v aws to check if AWS CLI is installed.

Redirects output to /dev/null to suppress errors.

Syntax:
```

``` bash
#!/bin/bash

# Function to check if AWS CLI is installed
check_aws_cli() { 
if ! command -v aws &> /dev/null then        echo "AWS CLI is not installed. Please install it before proceeding.       
return 1    
fi
}
check_aws_cli
```

## Check if environment variable exist to authenticate to AWS

To programmatically create resources on AWS, you need to configure authentication using various means such as environment variable, configuration files, or IAM roles.

The **~/aws/credentials** and **~/aws/config** files are commonly used to store AWS credentials and configuration settings, respectively.

Running the aws configure command you ran earlier creates these files. You can use the cat command to open them and see the content.

Credentials File (~/.aws/credentials)

The credentials file typically contains AWS access key ID and secret access key pairs. You will have only default section at first. But you can add other environments as required.

It is formatted as follows:

### Credentials File (~/.aws/credentials)

- default setting of aws access key and id

![](./Images/2a.%20aws_credential.png)

- added testing and production environments
![](./Images/2.%20aws-credentials.png)


### Config File (~/.aws/config)
The config file stores configuration setting for AWS services and clients. It can include setting such as the default region, output format, and profile just like the picture below.

![](./Images/3.%20region.png)

A profile will enable you to easily switch between different AWS configurations. If you set an environment variable by running the command export AWS_PROFILE=-testing this will pick up the configuration from both file and authenticate you to the testing environment.

AWS Profile The AWS_PROFILE environment variable allows users to specify which profile to use from their AWS config and credentials files. If AWS_PROFILE is not set, the default profile is used.

Here is what the function would look like;

``` bash
#!/bin/bash

# Function to check if AWS profile is set
check_aws_profile() {
 if [ -z \"$AWS_PROFILE\" ]; then
  echo "AWS profile environment variable is not set." 
  return 1
 fi
}
```

The **-z flag** is used to test if the value of the string variable (in this case, the value stored $AWS_PROFILE variable) has zero length, meaning it is empty or null.

The shell script will then look like this:

``` bash
#!/bin/bash

# Environment Variables
ENVIRONMENT=$1

check_num_of_args() {
# Checking the number of arguments
    if [ "$#" -eq 0 ]; then    
        echo "Usage: $0 <environment>"  
        exit 1
    fi
}

activate_infra_environment() {
# Acting based on the argument value
    if [ "$ENVIRONMENT" == "local" ]; then
        echo "Running script for Local Environment..."
    elif [ "$ENVIRONMENT" == "testing" ]; then
        echo "Running script for Testing Environment..."
    elif [ "$ENVIRONMENT" == "production" ]; then
        echo "Running script for Production Environment..."
    else  
        echo "Invalid environment specified. Please use 'local', 'testing', or 'production'."  
        exit 2
    fi
}

# Function to check if AWS CLI is installed
check_aws_cli() {    
    if ! command -v aws &> /dev/null; then
        echo "AWS CLI is not installed. Please install it before proceeding."       
        return 1
    fi
}
 check_aws_profile() {
      if [ -z "$AWS_PROFILE" ]; then
        echo "AWS_PROFILE environment variable not set."
        return 1
      fi
}
check_num_of_args
activate_infra_environment
check_aws_cli
check_aws_profile
```
