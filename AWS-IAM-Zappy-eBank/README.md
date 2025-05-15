# Identity Access Management (IAM)

**Identity and Access Management (IAM)** in `AWS` is a fundamental service that helps you securely manage who can access your `AWS` resources and what they can do with them. Its primary purpose is to control authentication (who can sign in) and authorization (what permissions they have) within your `AWS` environment.

**Purpose of IAM**

- `Authentication`: Verifying the identity of users, applications, or services trying to access AWS.

- `Authorization`: Defining and enforcing what actions they are allowed to perform, like launching instances, creating databases, or accessing storage.

- `User and Group Management`: Creating individual users and organizing them into groups to manage permissions more easily.

- `Policy Management`: Applying policies (sets of rules) that specify permissions and attach them to users, groups, or roles.

## How IAM Contributes to Security

- `Least Privilege Principle`: You can grant only the minimum permissions necessary for users to perform their tasks, reducing the risk of misuse.

- `Granular Access Control`: You can finely tune permissions at the resource level, such as allowing access only to specific `S3` buckets or `EC2` instances.

- `Temporary Credentials`: IAM roles can issue temporary security credentials, making access safer, especially for applications and services.

- `Multi-Factor Authentication (MFA)`: Adds an extra layer of security beyond passwords.

- `Audit and Compliance` : IAM integrates with AWS CloudTrail to log and monitor all `API calls` for auditing purposes.

## How IAM Contributes to Efficient Management

- `Centralized Access Control`: All permissions are managed from a single place, making administration simpler.

- `Delegation via Roles`: Services and external users (like third-party contractors) can be given temporary and controlled access through IAM roles without sharing permanent credentials.

- `Scalability`: As your organization grows, IAM can handle thousands of users, policies, and roles with organized management practices.

- `Automation and Federation`: IAM supports identity federation (e.g., connecting your corporate directory with AWS) and automation tools for large-scale account management.

## IAM Users

- `Definition`: An IAM user is an individual identity with specific credentials (username and password and access keys) used to interact with AWS services.
- `Purpose`: Represents a single person or application that requires direct access to AWS resources.
- `Permissions`: Permissions can be assigned directly to the user or inherited from group memberships.

### Use Cases:

Granting a developer access to manage EC2 instances.
Allowing a CI/CD pipeline to deploy applications to AWS.

## IAM Groups

- `Definition`: An IAM group is a collection of IAM users. Groups simplify permission management by allowing you to assign permissions to multiple users simultaneously.
- `Purpose`: To facilitates the management of permissions for multiple users who share similar access requirements.
- `Permissions`: Policies attached to a group apply to all its members.

### Use Cases:

Creating an "Admins" group with full access to AWS services.
Establishing a "Developers" group with permissions to manage development resources.

#### Best Practices

1. `Use Groups for Permission Management`: Assign permissions to groups rather than individual users to streamline access control.​

2. `Implement Least Privilege Principle`: Grant users only the permissions necessary to perform their tasks.​
3. `Regularly Review Group Memberships`: Ensure users are in appropriate groups to maintain security and compliance.

# The Principle of Least Privilege (PoLP)

The Principle of Least Privilege (PoLP) is a foundational security concept in AWS Identity and Access Management (IAM). It dictates that users, applications, and services should be granted only the permissions necessary to perform their tasks—no more, no less.

**What Is the Principle of Least Privilege?**

In AWS, the principle of least privilege ensures that each IAM identity (user, group, or role) has the minimal set of permissions required to fulfill its responsibilities. This approach minimizes the potential for accidental or malicious actions that could compromise security.

**Why Is It Important?**

- `Implementing least privilege in AWS offers several key benefits:`

- `Enhanced Security`: Limiting permissions reduces the risk of unauthorized access and potential damage from compromised credentials.
- `Reduced Attack Surface`: By granting minimal access, the potential pathways for attackers are minimized.
- `Compliance`: Many regulatory standards require strict access controls, which are facilitated by adhering to the principle of least privilege.
- `Operational Efficiency`: Simplified permission structures make it easier to manage and audit access rights.

## How to Implement Least Privilege in AWS IAM

To effectively apply the principle of least privilege in AWS:

1. `Start with AWS Managed Policies`: Utilize AWS-provided policies as a baseline, then customize them to fit specific needs.
2. `Use IAM Access Analyzer`: This tool helps identify unused permissions and suggests policy adjustments to enforce least privilege.
3. `Regularly Review Permissions`: Periodically assess and adjust IAM policies to ensure they align with current requirements.
4. `Implement Role-Based Access Control (RBAC)`: Assign permissions to roles based on job functions, and then associate users with appropriate roles.
5. `Apply Conditions in Policies`: Use policy conditions to restrict access based on factors like IP address, time of day, or request origin.

When John is assigned to the development-team IAM group with the `AmazonEC2FullAccess policy`, he inherits comprehensive permissions to manage Amazon EC2 resources. This AWS-managed policy grants full access to EC2, including actions like launching, terminating, and modifying instances, as well as managing security groups and key pairs. ​


## Key Considerations

- Scope of Permissions: The `AmazonEC2FullAccess` policy provides extensive permissions, which may exceed John's specific needs as a developer. This broad access could lead to unintended changes or security risks.​

- Principle of Least Privilege: To enhance security, it's advisable to follow the principle of least privilege by granting John only the permissions necessary for his role. This minimizes potential misuse or accidental disruptions.​

- Custom Policies: Creating a custom IAM policy tailored to the development team's requirements can provide more controlled access. For instance, limiting actions to specific EC2 operations or resources.​

- Resource Tagging: Implementing resource tags and using them in IAM policies can restrict access to specific EC2 instances, ensuring that John interacts only with designated resources. ​ AWS Repost

- Monitoring and Auditing: Utilize `AWS CloudTrail` and IAM Access Analyzer to monitor John's activities and validate that permissions align with intended access levels.

In this project, we will be working with a hypothetical fintech startup named Zappy e-Bank. This fictitious company represents a typical startup venturing into the financial technology sector, aiming to leverage the cloud's power to innovate, scale, and deliver financial services. The scenaria is set up to provide a realistic backdrop that will help to understand the application of AWS IAM in managing cloud resources securely and efficiently.

### The Importance of IAM for Zappy e-Bank

For Zappy e-Bank, like any company dealing with financial services, security and compliance are paramount. The company must ensure that its data, including sensitive customer information, is securely managed and that access to resources is tightly controlled. AWS IAM plays a critical role in achieving these security objectives by allowing the company to define who is authenticated (**Signedin**)
and authorized (**has permissions**) to use resources. 

### IAM will enable Zappy e-Bank to:

1. Create and manage AWS users and groups, to control access to AWS services and resources securely.

2. Use IAM roles and policies to set more granular permissions for AWS services and external users or services that need to access **Zappy e-Bank'** AWS resources.

3. Implement strong access controls, including multi-factor authentication (MFA), to enhance security.

This project will walk you through setting up IAM for **Zappy e-Bank**, creating a secure environment that reflects real-world usage and challenges. Through this hands-on experience, you will learn the fundamentals of IAM, how to manage access to AWS resources, and best practices for securing your cloud environment.


### Hands-on creating IAM users, group and policy

- 1. Login to your aws account as root user

![](./images/1.%20root-user-signin.png)

- 2. Navigating to the IAM Dahboard, and click on `Policy`.

![](./images/2.%20IAM-Policy.png)

- 3. Click on create policy.

![](./images/3.%20create-policy.png)

- 4. In the select a service section, search for Ec2

![](./images/4.%20service-dropdown-selectEC2.png)

- 5. Select the **"All Ec2 action"** checkbox

![](./images/5.%20All-EC2-Actions.png)

- 6. Select all in the resource section and click next

![](./images/6.%20select-all-resources.png)

- 7. Provde the name `developers` and `description` for policy

![](./images/7.%20zappy-policy-details.png)

- 8. Click on `Create Policy`

![](./images/7b.%20create-policy.png)

Notice that after creating the policy, if you search for `developer` in the search box, you will notice that a number of policies are returned. This highlights the presence of both AWS managed and customer managed policies. `AWS managed policies` are predefined by AWS and provide permissions for many common use cases, allowing for quick and broad access management across AWS services without the need for custom policy creation like we just did. In contrast, customer managed policies are created and fully controlled by you, allowing for more tailored, specific access controls that can be finely tuned to your organization's requirements.

- 8. Check that `developer` policy is created

![](./images/8.%20developers-searchbar.png)

### Creating policy for Data Analyst Team

- 9. navigate to your dashboard and click `policy` on the left and `create policy` on the right

![](./images/3.%20create-policy.png)

- 10.  In the policy editor, click all s3 actions as shown below.

![](./images/9.%20S3-user.png)

- 11. click on `All` in the resource section and click `next`

![](./images/10.%20s3-next.png)

- 12. in the policy details, write the policy and the description

![](./images/11.%20S3-analyst.png)

- 13. Check that `Analyst` policy is created

![](./images/12.%20created-successfully.png)

## Creat group for development team

- 14. In the IAM console navigation, select `User group` and in the top right click `Create group`

![](./images/13.%20user-group.png)

- 15. provide the name of the group

![](./images/14.%20dev-team.png)

- 16. Attach the developer policy to the group. This will allow any user in the `Development-Team` group to have access to EC2 instances alone, and click on create group.

![](./images/15.%20create-user-group.png)

- 17. development group created successfully

![](./images/16.%20dev-defined.png)


## Creat group for Analysts team

- 18. In the IAM console navigation, select `User group` and in the top right click `Create group`

![](./images/17.%20creating-analyst-group.png)

- 19. Name the group

![](./images/18.%20analyst-team.png)


- 20. Attach the Analysts policy to the group. This will allow any user in the `Analysts-Team` group to have access to S3 alone, and click on create group.

![](./images/19.%20analyst-team-created.png)


- 21. Analyst group created successfully

![](./images/20.%20analyst-defined.png)


### Create IAM User for John

Navigate to the IAM dashboard, select `User`, and click on `create user`

![](./images/21.%20user-create-user.png)

- 22. Write user details, and check the `provide user access to AWS management`

![](./images/22.%20specify-users-details.png)


- 23. Check these box as well and click on next

![](./images/22b.%20iam-user-creation.png)

- 24. Permissions: Add John to the development-team Group and click next

![](./images/23.%20john-deve-team.png)

- 25. Click on create User and download the credentials for John

![](./images/24.%20review-create.png)

### Create IAM User for Mary.

- 26. Navigate to the IAM dashboard, select `User`, and click on `create user`

![](./images/25.%20creat-user4mary.png)

- 27. Write user details, and check the `provide user access to AWS management` and check the second box `i want to create an IAM User`

![](./images/26.%20maryIAMuser.png)

- 28. check thses boxes as well and click on next

![](./images/26b.%20maryNext.png)

- 29. Permissions: Add Mary to the `Analysts-team Group` and click next

![](./images/27.%20add-user-to-group.png)

- 30. download Mary's credentials

![](./images/28.%20download-login.png)

## Testing and Validating.

- 31. Testing John's access
- Login to John's aws account

![](./images/29.%20john-login.png)

- 32. Navigate into John's dashboard

![](./images/30.%20john-dashboard.png)

- 33. Navigate to John's EC2 dashboard to launch an Instance.

![](./images/31.%20john-ec2.png)

- 34. John launch an Ec2 instance named `zappy e-Bank`

![](./images/32.%20john-launch-instance.png)

- 35. John is denied access to naviagte his dashboard or even create IAM user.

![](./images/33.%20John-IAMdashboard-denial.png)

### Testing Mary's access

- 36. Login to Mary's AWS account

![](./images/34.%20Mary-login.png)

- 37. Navigate into Mary's dashboard

![](./images/35.%20mary-login-fully.png)

- 38. Mary create S3 bucket named `zappy-s3`

![](./images/36.%20mary-s3-bucket.png)

- 39. S3 bucket created successfully

![](./images/37.%20s3-creation.png)

- 40. Mary is denied `IAM ` access

![](./images/38.%20mart-IAM-user.png)


## Implementing Multi-Factor Authentication (MFA)

- 41. setting up MFA for John, click on user and then click on John.

![](./images/39.%20johnMFA.png)

- 42. Click on enable MFA as shown below

![](./images/40.%20enablejohn-mfa.png)

- 43. Enter a device name for John and MFA and select authenticator app

![](./images/41.%20mfa-setup-4john.png)

- 44. open your google authenticator on your mobile device to scan the QR code.

![](./images/42.%20JOHN-SQR.png)

- 45. by completing step 1-5, MFA will be enabled for John

![](./images/43.%20mfa-added.png)

### Setting up MFA for Mary 

- 46. click on user and then click on Mary.

![](./images/44.%20maryMFA.png)


- 47. Click on enable MFA as shown below

![](./images/45.%20enableMary-MFA.png)

- 48. Enter a device name for Mary and MFA and select authenticator app and click on next.

![](./images/46.%20MFA-setup-4mary.png)

- 49. open your google authenticator on your mobile device to scan the QR code, also enter the codes generated by the authenticated.

![](./images/47.%20Mary-SQR.png)

- 50. by completing step 1-5, MFA will be enabled for Mary.

![](./images/48.%20Mary-Mfa-added.png)























 

