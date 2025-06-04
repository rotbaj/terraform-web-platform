# AWS S3 (Simple Storage Service)

Amazon  S3 is a vital component of Amazon Web Service (AWS) for storing and accessing data.

## What is Amazon S3?
Amazon S3, or Simple Storage Service, is like a big digital warehouse where you can store all kinds of data. It's part of Amazon Web Services (AWS), which is a collection of cloud computing services.

Think of S3 as a giant virtual filing cabinet in the cloud. You can put files, documents, pictures, videos, or any other digital stuff you want to keep safe and accessible.

What's cool about S3 is that it's super reliable and secure. Your data is stored across multiple servers in different locations, so even if something goes wrong with one server, your files are still safe.

Plus, S3 is really flexible. You can easily access your files from anywhere in the world using the internet, and you can control who gets to see or edit your stuff with different levels of permissions.

## S3 Benefits

Amazon S3 offers a range of benefits that make it a top choice for storing and manaaina data in the cloud.

Firstly, S3 provides exceptional durability and reliability. Your data is stored across multiple servers and data centers, ensuring that even if one server falls, your files remain safe and accessible.

Secondly, S3 offers scalability, meaning you can easily increase or decrease your storage capacity as needed. Whether you're storing a few gigabytes or petabytes of data, S3 can handle it without any hassle

Another key benefit of S3 is its accessibility. You can access your data from anywhere in the world using the internet, making it convenient for remote teams or distributed applications.

Security is also a top priority with S3. You have full control over who can access your data and can encrypt your files to ensure they remain confidential and secure.

Additionally, S3 is cost-effective. You only pay for the storage you use, with no upfront fees or long-term contracts, making it a budget-friendly option for businesses of all sizes.

## S3 Use Cases

- Backup: Think of it as a safe place to keep copies of important files, like your computer's backup. If anything happens to your computer, you can get your files back from S3.

- Website Stuff: S3 can also hold all the pieces of a website, like images and videos. So, when you visit a website, some of the stuff you see might be stored in S3.

- Website Stuff: S3 can also hold all the pieces of a website, like images and videos. So, when you visit a website, some of the stuff you see might be stored in S3.

- Videos and Photos: You know all those videos and photos you share online? They're often stored in S3 because it's really good at eeping them safe and making sure they load fast.

- Apps and Games: S3 is also used by apps and game to store things like user profiles or game levels. It helps keep everything running smoothly and makes sure your progress is saved.

- Big Data: Companies use S3 to store huge amounts of data for things like analyzing customer behavior or trends. It's like having a big library where you can find all sorts of useful information.

- Emergency Backup: Some companies use S3 to store copies of their data incase something bad happens, like a natural disaster. It's like having a backup plan to keep things going no matter what. 

- Keeping Old Stuff: Sometimes, companies have to keep old records for legal reasons. S3 has special storage options that are really cheap, so it's a good place to keep all that old stuff without spending too much money.

-  Sending Stuff Fast: S3 works with a service called CloudFront, which helps deliver stuff really quickly to people all over the world. So, if you're watching a video or downloading a file, S3 helps make sure it gets to you fast

## S3 Core Concepts

- Buckets: Think of buckets as folders where you can store your files. Each bucket has a unique name and can hold an unlimited number of objects (files).

- Objects: Objects are the individual files you store in S3, like photos, videos, documents, or any other type of data. Each object has a unique key (file name) and can range in size from a few bytes to terabytes.

- Keys: Keys are unique identifiers for objects within a bucket. They're like the file names you use on your computer. You can organize obiects within a bucket using folder-like structures in their keys, called prefixes.

- Storage Classes: S3 offers different storage classes to suit various use cases and budget requirements. These include Standard, Standard-IA (Infrequent Access), One Zone-IA, Intelligent-Tiering, Glacier, and Glacier Deep Archive. Each class has different durability, availability, and cost characteristics.

- Access Control: You can control who can access your objects in S3 using Access Control Lists `(ACLS)` and Bucket Policies. You can also use Identity and Access Management (IAM) to manage access at a user or group level.

- Durability and Availability: $3 is designed for 99.999999999% (11 nines) durability, meaning your data is highly resistant to loss. It also affers high availability, ensuring that your buckets are accessible whenever you ned them.

- Data Transfer: S3 supports both inbound (upload) and outbound (download) data transfer. You can transfer data to and from $3 using various methods, Including the AWS Management Console, CLI (Command Line Interface), SDKs (Software Development Kits), or third-party tools.

- Versioning: S3 Versioning allows you to keep multiple versions of an object in the same bucket. This feature helps protect against accidental deletion or overwrite, as you can restore previous versions of an object if needed.

**Note**

**Storage class-** A storage class in Amazon S3 is like a category or type of storage option for your data. Each storage class has its own set of  characteristics, such as cost, durability, and availability, that determine how your data is stored and managed in the cloud. You can choose the storage class that best fits your needs based on factors like how frequently you access your data, how quickly you need it, and how much you're willing to pay for storage.

**AWS Management Console:** It's a website where you can manage all your AWS

services asing a point-and-click interface. You can do things like starting virtual servers, storing files, and setting up security rules, all without needing to write any code.

**CLI (Command Line Interface):** This is a tool that lets you control AWS services using text commands typed into a terminal or command prompt. It's handy for automating tasks and scripting repetitive actions.

**SDKs (Software Development Kits):** SDKs are packages of tools and code that help developers build applications that use AWS services. They provide ready-made functions and examples to make it easier to integrate AWS into your software projects, whether you're coding in Java, Python, JavaScript, or another language.

## What is S3 Versioning?

Imagine you're working on a big project and you accidentally delete an important file. But wait, with S3 versioning, it's like having a magic undo button.

Here's how it works: Normally, when you delete a file in S3, it's gone for good. But with versioning turned on, $3 keeps a copy of every version of your file, even if you delete it or overwrite it. So if you make a mistake, you can easily go back to a previous version and restore it, just like rewinding time.

This feature is super handy for protecting your data from accidents or malicious actions. It's like having a safety net for your files, ensuring that even if something goes wrong, you can always recover your precious data. Plus, it's easy to turn on and manage, giving you peace of mind knowing that your files are always safe and sound in Amazon S3.

### Step by Step Creating of S3 bucket, versioning and implement lifecycle policy.

- Navigate to the AWS management console and search for `S3`


![](./Images/1.%20S3-console.png)


- Locate and click on `create bucket` button

![](./Images/2.%20S3-creation.png)

- Create a New Bucket and provide a unique name
- Select `ACL Disable`.

![](./Images/3a.%20S3creation-ACL-disabled.png)

- Block All Public Access
- Disable Bucket Versioning.

![](./Images/3b.%20blockpublicAccess-BlockVersion.png)

- Proceed with the default setting 
- once done, click the create button

![](./Images/3c.%20createBucket.png)

**Note-** ACL, or Access Control List, is like a set of rules that decides who can access your stuff in Amazon S3. You can use ACL to grant or deny access to your buckets and files for specific AWS accounts or predefined groups of users. It's a way to control who gets to see or mess with your data in the cloud.

- Note... For futher details on naming the conversations, please refer to this document, click [here](https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html)

- Bucket created successfully

![](./Images/4.%20bucketCreated.png)

- Object store empty

![](./Images/5.%20NoObjectstored.png)


## Part Two

- create a file on laptop with some data "Welcome to the AWS World" and save

![](./Images/6.%20file.png)

- Next click on `upload button`

![](./Images/7.%20uploadbutton.png)

- Click on `Add File` and select the file that you've created, you will see the file added then,
- Click Upload

![](./Images/8.%20fileuploaded.png)


- The object has successfully be uploaded to the S3 Folder.

![](./Images/9.%20successfulUpload.png)


## Part Three: Enabling Versioning

- Inside the bucket's properties section on the right side, you will notice that versioning is currently disabled.

![](./Images/10.%20property.png)

- Enable it
- Click on Edit

![](./Images/11.%20edit2enable.png)

- Select Enable
- Save changes to enable versioning for the bucket.

![](./Images/12.%20enable-save.png)

- Modify the content of the file on your laptop and add upload it again.
- you will create a new version for the file.

![](./Images/13.%20AddinfMoreContenttoFile.png)


-  Click on show version
- this will allow you see all the versions of the file uploaded.

![](./Images/14.%20PermissionNedit.png)

Note: When ever you make changes to the file and upload it again to the same bucket, it will continue to create version of that file for futuer reference.

## Part Four

Veiwing the content of both `Versions` and `Setting Permissions`

- In the permission section of the bucket, notice that ``Block all public access` is enabled

- Click on `Edit to make changes`

![](./Images/15.%20permission-and-edit2.png)


- Uncheck the `Block all public access` option

- Save changes

![](./Images/16.%20Uncheck.png)


- Type `Confirm` and click on `Confirm`

![](./Images/17.%20confirm.png)

By clicking this action, you are allowing you file to be publicly accessible. This confirmation step ensures that you are aware of the implication of making your file public.

- Block public access setting the bucket is successfully edited.
- block all public access is `Off`

![](./Images/18.%20Off.png)


Create a bucket policy to specify the actions you want the policy to be able to perform on your file.
- Click on `Edit`

![](./Images/19.%20bucket-Policy.png)


- Click on policy generator

![](./Images/20.%20Policy-generator.png)


- Now, select the `Type of Policy` as 'S3 Bucket Policy

- Set the `Effect` to `Allow`,

- specify the `Principal` as `*`, which means all users.

- Choose the action `Get object` and `Get object version`,

- in the field of Amazon Resource Name (ARN), type the ARN of your bucket and add by /* after the ARN. Then,

- Click on `Add Statement`

# So Actual ARN is 
### arn:aws::s3:::sandraolis-s3

## and we need to add /*
### arn:aws::s3:::sandraolis-s3/*

- Note- ARN stands for Amazon Resource Name. It's like a unique address for every resource in AWS, such as buckets in S3. Just like your home address tells people where you live, an ARN tells AWS where a specific resource is located. It helps AWS know exactly which resource you're referrin to when you're setting up permissions or policies.

- Click on `generate policy`

![](./Images/21.%20GeneratePolicy.png)


- Copy the `Policy JSON Document` link 

![](./Images/22.%20closepolicy.png)


**"Id": "Policy1714394236530"**: This line specifies the unique identifier for the policy. The ID is used for reference and can be helpful for managing policies within AWS.

**"Version": "2012-10-17"**: This line indicates the version of the policy language being used. In this case, it's using version "2012-10-17 of the policy language.

**"Statement": [...]**: This line begins the definition of the policy's statements. Policies can have multiple statements, each defining a set of permissions

**"Sid": "Stmt1714394172266"**: This line assigns a unique identifier to the statement. Similar to the policy ID, the statement ID is used for reference and management purposes.

**"Action":["s3:GetObject", "s3:GetObjectVersion"]**: This line specifies the actions allowed by this policy. In this case, it allows the s3 GetObject and
s3:GetObjectVersion actions, which are used to retrieve objects and object versions from an S3 bucket.

**"Effect": "Allow"**: This line specifies the effect of the statement, which can be either `"Allow"` or `"Deny."` Here, it indicates that the actions specified in the Action field are allowed.

**"Resource": "arn:aws:s3:::my-first-s3-bucket-090/":** This line specifies the AWS resource to which the poljcy applies. In this case, it applies to all objects (/) within the 53 bucket named my-first-s3-bucket-090. The ARN (Amazon Resource Name). uniquely identifies the resource.

**"Principal": ""**: This line specifies the entity to which the policy applies. The wildered manns that the nolicy nonlies to all users ont inleslie anunencinall in the AWS account.

- Copy the link and click cose

![](./Images/22.%20closepolicy.png)


- Navigate to the policy tab 
- Paste the policy you have created using the policy generator.
- Click on save changes

![](./Images/23.%20bucketPolicyTab.png)


- Click on the version of your file

![](./Images/24.%20fileVersion.png)

- Click on the object URL

![](./Images/25.%20file%20URL.png)

Note if `Access deniel
- navigate to the object url page and click on `Object action`
- click on `share with presigned url` copy it and paste on new browser

![](./Images/26.%20enabled.png)


- Click on the lastest version

![](./Images/27.%20Fileversion2.png)


- Click on the object URL

![](./Images/28.%20fileversion2URL.png)


- Paste on a new browser to display the new data

![](./Images/29.%202Contents-showing.png)


## Part Five

### Creating Lifecycle Policies

- Navigate to the management section of the bucket

- Click on `Create lifecycle rule`

![](./Images/30.%20Lifecyclepolicy.png)


- Give the specification.

![](./Images/31.%20lifecycle-rule.png)


- Add the object size

![](./Images/31b.%20lifecyclerule.png)



- Choose the actions you want the rule to perform

![](./Images/32.%20cont.30.png)


- Click to create rule

![](./Images/33.%20create-rule.png)


- The lifecycle policy is been created successfully

![](./Images/34.%20myLifeCycleRuleCreated.png)


This rule is set up to automatically move files from one type of storage to another in your Amazon S3 bucket. Specifically, it moves files to a storage type called Standard-IA after they've been sitting in your bucket for 30 days. This helps you save money becouse Standard-IA storage is cheaper than the default storage option. So, if you have files that you don't access very often but still want to keep, this rule helps you save costs by storing them in a cheaper storage class after a certain period of time

For more information about storage classes, you can go through Amazon S3 Storage Classes. And about storage lifecycle, you can go through Managing your storage lifecycle.






