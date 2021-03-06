# AWS Certified Developer Associate

* https://acloud.guru/
* https://www.udemy.com/aws-certified-developer-associate/learn/v4/overview


Certifications in mostly order of difficulty

* Associate tier
    * Certified developer associate
    * Certified solutions architect Associate
    * Sysops administator associate
* Professional tier (more advanced)
    * Devops professional
    * Solutions architect professional


https://aws.amazon.com/certification/certified-developer-associate/

Aim to get 70% to pass (pass mark is moveable)

AWS (SQS only) announced first in 2004

Re-invent is the main AWS conference
2013 - first certifications

Only need to know a few of the AWS services in depth for the exam


### Layer 0: Global infrastructure

* https://aws.amazon.com/about-aws/global-infrastructure/

Important:

* A region is a geographical area
* An availability zone (AZ) is a data center
    * Amazon docs actually call them "EC2 availability zones"
        * so does that imply that not all services are "zoned"???
* Each region has 2 or more availability zones
* Edge locations are CDN endpoints for cloudfront
    * there are many more edge locations than AZs (currently over 50 edge locations)
    * edge locations are where users access AWS content

* Unoffical content:
    * each AZ can be only meters apart provided it has separate power, network
    * each AZ in a region is connected with a direct fibre link
        * capacity 25Tbps, latency 1-2ms


Relevant for NZ
    * Closes region is _Asia Pacific Sydney_
    * they have 3 data centers (AZs) in Sydney
    * they have 2 availability zones (data centers) in Singapore
    * there are edge locations in Sydney and melbourne
    * nothing in NZ

### Layer 1: networking

* sits on top of the global infrastructure

* Virtual private cloud (VPC)
    * Virtual data center
    * can have multiple VPCs in your account
    * can get them to peer with each other
    * a "data center" which exists in your account
    * each VPC has a logcially isolated set of resources
    * each VPC in your accoun can be in different regions

* Direct connect
    * connect to the AWS without using using a internet connection
    * uses dark fibre
    * connects directly into AWS

* Route 53
    * is their DNS service
    * called route 53 because DNS is on port 53

### Compute

* EC2
    * EC2 instance is a virtual server
    * can provision and log on
* EC2 container service
    * amazon's ECS
    * lets you run and manage docker containers on a cluster of EC2 instances
    * uses EC2 instances
    * essentially running docker on EC2
    * not currently on the exam
* Elastic beanstalk
    * service for deploying and scaling apps
    * for devs to upload their code then aws inspects and provisions it
    * "AWS for beginners"
    * covered in the this exam at a very high level
* Lambda
    * lets you run code without provisioning or managing servers
    * Acloud.guru runs entirely on it
    * you only pay for compute time you actually use - you are only charged when your code is actually running
    * doesn't feature heavily in the exam at the moment

# Storage

* S3
    * big topic in exam
    * object based storage not block based storage
    * place to store files in the cloud
    * secure, durable, highly-scalable
    * you only pay for the storage you actually use
* Cloudfront
    * CDN service
    * Integrates with other products e.g. S3
    * edge location is a place with caches your files
    * is a fairly big part of the exam
* Glacier
    * for data archiving and long term back
    * can take up to 4hrs to access data
    * archiving service in the cloud
* EFS elastic filesystem
    * NAS in the cloud
    * is block level storage
    * you can setup an EFS instance and share it between EC2 instaces which can use it as a NAS
    * does not yet feature in exams much
* Snowball
    * part of import/export service
    * lets you send your own hard disks to AWS
    * they will load the data from the disks onto storage
    * so you don't have to send your data over the internet
    * snowball is the enterprise version of this
        * a suitcase looking device
        * you pay for it on a daily basis
        * is a "petabyte scale data transport solution
        * http://cdn.geekwire.com/wp-content/uploads/2015/10/screenshot_844-620x383.jpg
* Storage gateway
    * connect on-premise storage wtih cloud based storage
    * a little VM you run in your office/data centers
    * it replicates data from your local office/data center to the AWS cloud

# Databases

* RDS
    * relational database service
    * backbones of AWS
    * popular exam topic
    * mysql, sqlserver, oracle, postgres, aurora, mariadb
* DynamoDB
    * most important topic in this exam
    * nosql DB service
    * push button scalability
    * this is the thing to have the best undersanding of going into the exam
* Elasticache
    * two engines: memcached, redis
    * lets you do caching in the cloud
    * lets you save on DB queries using it
* Redshift
    * business intelligence service
    * doesn't come up much in this exam
* DMS Database migration services
    * lets you migrate you DB data from one DB to another e.g. oracle to mysql
    * very new technology, probably not in the exam yet
    * https://aws.amazon.com/dms/
        * seems to only go {oracle, sql-server} -> {mysql, postgres, aurora}
        * target database must be in RDS or EC2

# Analytics

* EMR Elastic map reduce
    * can come up in exam
    * way of processing big data
* Data pipeline
    * way of moving data from one service to another
    * comes up in the solutions architect professional course
* Elastic search
    * open source searcn and analytics engine
    * not in exam
* Kinesis
    * platform for collecting, storing, processing streaming data
    * is sometimes in exam
* Machine learning
    * lets devs use machine learning
    * not in exam
    * amazone use this to recommend products to you
* Quick sight
    * like IBM "cognos" http://www-01.ibm.com/software/analytics/cognos/
    * fast, cloud powered business intelligence service
    * is very new
    * not in exam

# Security and identity

* Identity access management (IAM)
    * control users, groups, roles etc.
* Directory services
    * can be in exam
* Inspector
    * allows you to install agents onto EC2 instances which will do a security inspection
    * very new, not in exam
* WAF (Web application firewall)
    * very new, not in exam
* Cloud HSM Hardware security module
    * way of securing your cloud with hardware based security devices
* KMS
    * Key management service

# Management tools

* Cloud watch
    * performance monitoring (not security or auditing) your AWS environment and instances
* Cloud formation
    * allows you to script your infrastructure
    * lets you duplicate instances and stacks in various regions etc.
    * sort of "chef for AWS" maybe ???
    * comes up in the colutions architect courses but not so much this one
* Cloud trail
    * used for auditing
    * any changes to AWS environment can be captured by cloudtrail
* Opsworks
    * configuraiton management service
    * lets you config things iwth chef
* Config
    * new, not in exam
    * fully managed service which provides you with an
        * AWS resource infentory
        * configuration hsitory
        * configuration change notifiations
        * config rules let you create rules to check the configuration of your AWS
            * lets you say "all volumes on my EC2 instance should be encrypted"
* Service catalog
    * not in exam
* Trusted advisor
    * automated service that scans your environment to increase security or save money
    * two tiers: free tier and busniess+enterprise support plans
    * for exam we need to know what it can and cannot do
* API gateway
    * not on exam
    * lets dev create and manage API endpoints
* Appstream
    * AWS version of "zenapp"
    * lets you stream windows app form the cloud
    * new, not on exam
* Cloudsearch
    * managed service to setup a search solution for your data
    * supports highlighting, autocomplete, geospatail search
    * not on exam
* Elastic transcoder
    * media transcoding service in the cloud
    * exam: only need ot know what it does
* Simple email service
    * send transactional emails, marketing emails (kind of mandrill, mailchimp alternative)
* SQS
    * deouples your infrastructure
    * was first service ever launched
    * needed for exam
* Simple workflow services
    * lets you create and manage background jobs
    * need to know diff between SQS and SWF
* CodeCommit
    * basically: AWS github
    * fully managed source control service
    * host private git repos
    * not detailed on exam - only need to know what the service does
* CodeDeploy
    * automates code deployment to any instance (EC2 or on premise)
    * not detailed on exam - only need to know what the service does
* CodePipeline
    * not detailed on exam
    * builds tests and deploys code
    * AWS CI
    * only need to know what the service does

# Mobile

* Mobile hub
    * build/test/monitor usage of mobile apps
* Cognito
    * save mobile user data (app prefs, game state) in cloud
    * sort of a parse for AWS
    * can be used as an identity provider by IAM
* Device farm
    * test your mobile app/site across multiple devices
* Mobile analytics
    * measure app usage and revenue
* SNS Simple Notification Service
    * is a big topic in the exam
    * lets you setup and send notifications from the cloud

# Enterprise

* Workspaces
    * Virtual desktop in the cloud (VDI)
    * basically: AWS Citrix
* Work docs
    * basically: AWS Dropbox
* Work mail
    * basically: AWS MSExchange

# IoT

* very new
* huge topic
* may have its own certification at some point

# Identity Access Management IAM

* allows you to manage users
* gives you identity federation to
    * facebook
    * linkedin
    * ActiveDirectory
* supports multifactor authentication
* allows you to provide temporary access for users/devices and services when necessary
    * how ???
* allows you to setup your own password rotation policy
* supports PCI-DSS compliance


Terminology

* user
    * an individual user
* group
    * a collection of users
* role
    * a role can be _applied_ to both users and AWS services
    * allows resources in AWS to access other resources in AWS without having to setup and store usernames and passwords
    * when a user is authenticated by some other entity (i.e. they are not an IAM user) they assume a role to get access to AWS resources
    * Exam q:
        * You can assign a one (and only one!) role to an EC2 instance during provision
        * Once an EC2 instance has been provisioned you cannot switch roles for it! GOTCHA
            * you can change the permissions on the role while the EC2 instance is running but you cannot change the role
* policy
    * a document that defines one or more permissions
        * attach them to users, groups, roles
    * Each policy has a "policy document" which is a blob of JSON
        ```
        // the AdministratorAccess policy
        {
        "Version": "2012-10-17", // this is always the same
        "Statement": [ // can have multiple statemetns
            {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
            }
        ]
        }
        ```
    * Attach policies to groups and then put users in the gorups
        * don't attach policies to users usually

Random exam questions

* Oregon is the default region when you setup a new AWS account
* IAM is not region specific - it is global (there is a q on exam about this)
* By default when you create a new user they have no permissions!

Root account is the email address you used when you setup the AWS account
    * best practice
        * always use MFA for root account
        * don't login as that account to do day to day admin stuff

### Federation

* With identity federation, external identities (federated users) are granted secure access to resources in your AWS account without having to create IAM users.
* These external identities can come from
    1. your corporate identity provider (such as Microsoft Active Directory or from the AWS Directory Service)
    2. from a web identity provider, such as Amazon Cognito, Login with Amazon, Facebook, Google or any OpenID Connect (OIDC) compatible provider.
* IAM supports identity providers who are compatible with either Security Assertion Markup Language (SAML) 2.0 or OpenID Connect (OIDC)

#### Active Directory Federation

http://blogs.aws.amazon.com/security/post/Tx71TWXXJ3UI14/Enabling-Federation-to-AWS-using-Windows-Active-Directory-ADFS-and-SAML-2-0

* You can authenticate yourself to AWS with your Active Directory credentials
* You do it with a _Security Assertion Markup Language_ (SAML) token
* On the AD side it uses _Active Directory Federation Services_ (ADFS)
* Steps
    1. you authenticate yourself to the AD server on your corporate network and it gives you a SAML token
    2. your browser gives that SAML token to the "AWS sign-in endpoint for SAML" aka https://signin.aws.amazon.com/saml
        * The AWS SAML services uses the `AssumeRoleWithSAML` API to request temporary security credentials (API name is on exam)
        * it then constructs a sign-in URL for the management console
        * it then gives that URL to the browser
    3. You have successfully authenticated yourself to AWS and can see the dashboard
* You always authenticate against Active Directory first and then use the token you authenticate to AWS


Aside: you can create windows servers on AWS
    what kind of virtualization does that use?
    can windows VMs and linux VMs be on the same hardware?

#### Web identity federation

https://web-identity-federation-playground.s3.amazonaws.com/index.html

* for the exam: you need to know that you _can_ use facebook, google, any OIDC provider to autenticate yourself to aws
    * don't use the phrase "login" because you don't have an IAM user so maybe it is not accurate

Random exam q: ARN = Amazon resource name

This is an OpenID flow

1. Login in with your identity provider and get an access token from them
2. Get _temporary_ security credentials
    * Make a `AssumeRoleWithWebIdentity` request (hint: name of API call is in the exam)
    * this will let you assume a _role_ (note: not a user) that was created for you
        * => roles can be humans sometimes!
3. You can use that role to access things


# EC2

You start with nothing but one security group which is the default security group in the default VPC


An Amazon Machine Image (AMI) is a _template_ that provides
    * operating system
    * application server
    * applications
* Sources of AMIs
    * Amazon provides approx 22 images
    * you can buy others from the marketplace
        * these tend to be provided by software vendors and have their software pre-installed
        * sometimes 3rd parties have pre-installed OSS apps e.g. gitlab
    * download community made ones
    * make your own

Free tier = you can run certain micro instaces for 1 year for free

* Amazon have their own linux AMI which includes many common server packages
    * it is based on red hat (uses yum at any rate)
* the data in an instance store is not permenant - it persists only for the lifetime of the instance

```
# example instance specs
t2.micro (Variable ECUs, 1 vCPUs, 2.5 GHz, Intel Xeon Family, 1 GiB memory, EBS only)
```

Choosing region and data center for your instance
* choose region before you create the instance
* choose AZ (data center) by choosing the subnet the instance is in during instance setup

* Shutdown behaviour
    * stop = just stop the instance
    * terminate = stop & delete the instance
* "User data" field
    * a textarea where you can paste a shell script that will be run as root when the instance is launched
        * it is only run automatically when the instance is _launched_
        * if you stop instance, change user-data, start instance you will have to run it manually
        ```
        curl http://169.254.169.254/latest/user-data | sh
        ```
    * max 16k
    * you can submit user data via the API but you must base64 encode it first
    * to modify user data for a running instance
        1. stop th einstance
        2. modify the user data section vai the AWS web console
        3. start the instance - the new userdata will be picked up
    * if you modify user data it will be
    * you can get user data back from a running instance by either
        * `curl http://169.254.169.254/latest/user-data` from the instance
        * Use the web console
* Security group
    * basically configured the firewall that your instance will sit behind
* EC2 instanace has two network interfaces
    1. private: lets you access other AWS resources in the
        * this is the only one visible when ssh'd into the box
        * hostname is built from this IP address
    2. public: lets you ssh in
        * not visible when you `ifconfig -a` within the instance

To figure out what the default username for an image is

```
# try to ssh in as root and it will fail but prompt us with correct username
$ ssh 52.63.84.255  -l root -i EoinAwsLearningTest1.pem
Please login as the user "ec2-user" rather than the user "root".

Connection to 52.63.84.255 closed.
```

To SSH to an EC2 instance

```
# get IP address from the instance description in AWS console
# EoinAwsLearningTest1.pem is the private key you created when creating the instance
# ssh will refuse to use an identity file that is world writable
# ec2-user is the default username for Amazon AMI images
# ubuntu is the default username for Ubuntu images
# -l sets login name
# -i sets identity file
chmod 0600 EoinAwsLearningTest1.pem
ssh 52.63.84.255 -l ec2-user -i EoinAwsLearningTest1.pem
```

AMI attributes
    * root device type
        * EBS
            * of 38k community AMIs, 30k are this
        * Instance store
            * of 38k community AMIs, 8k are this
    * virtualization type
        * HVM
            * TODO: find out more
        * paravirtual
            * TODO: find out more

Aside: Opsworks

> From devops slack:
> OpsWorks is chef-solo with triggers around Auto Scaling Groups lifecycle +
> JSON hints for AWS instance metadata as far as I know.


Roles again

Creating a role:

1. choose name for role
2. choose "role type"
    * role type is the kind of resourse that will use this role to access other resources
        * the role type controls where trusted entities come from i.e. things trusted to play the role
        * example
            * Amazon directory services
                * `Trusted entities: The identity provider(s) ds.amazonaws.com`
            * Amazon EC2
                * `Trusted entities: The identity provider(s) ec2.amazonaws.com`
* Exam Q: you cannot assign new roles to an existing EC2 instance - roles can only be assigned at creation

Each EC2 instance can only have one role which must be assigned at creation
    * that role can have many policies attached
    * can the policies be edited afterwards?


Aside: `~/.aws/credentials` overides any credentials in `~/.aws/config`

* Accessing S3 (or any AWS resource) from an EC2 instance
    * you can setup access to S3 from an EC2 instance via the command line tools the same way you would on your laptop
        * -- is a security hole as if EC2 instance is compromised your keys must be changed
        * roles is safer - role at least forces attacker to get to your s3 from the EC2 instance not from any computer they choose

Aside: starting an instance via the API

```
# we could use the user data to configure each server to play a different role
# (that's probably a bad approach, just an example)
aws ec2 run-instances --image-id ami-2bb65342 --count 3 --instance-type t2.micro --user-data "rails|postgres|redis"
```

#### EC2 instance metadata REST API

While ssh'd into an EC2 instance you can use `curl` to hit a HTTP endpoint that
returns metadata about the instance you are currently on

```
# list available metadata
$ curl http://169.254.169.254/latest/meta-data/
ami-id
ami-launch-index
ami-manifest-path
block-device-mapping/
hostname
iam/
instance-action
instance-id
instance-type
local-hostname
local-ipv4
mac
metrics/
network/
placement/
profile
public-hostname
public-ipv4
public-keys/
reservation-id
security-groups

curl http://169.254.169.254/latest/meta-data/hostname # see hostname
curl http://169.254.169.254/latest/meta-data/public-ipv4 # see public IPv4 IP address NB
```

Note: `ifconfig` will show you only the private interface of your instance - you must use the metadata to get the public interface IP

You can use the REST API with curl in your shell scripts that automate your instances
The REST API knows things like the order your instances were launched in a group


Random things you need to know for the exam

* multiple SSL certificates can be terminated on a single elastic load balance (ELB)
* ELBs are not free
    * you are charged by the hour and per GB
* services which are free (but the resources they spin up are not free)
    * Cloud formation
        * Gotcha: the resources you spin up via cloud formation are paid
    * Elastic Beanstalk
        * Gotcha: the resources you spin up via elastic beanstalk are paid
    * Autoscaling
        * Gotcha: the resources you spin up via elastic beanstalk are paid
* ELBs can use the following ports
    * 25 SMTP
    * 80 HTTP
    * 443 HTTPS
    * 1024-65535 Custom ports
* HTTP Codes
    * 200 = request succeeded
    * 3xx = redirection
    * 4xx = client error
        * 404 URL not found
    * 5xx = server error
* You need to know the curl URL to use to get the public IP address of an EC2 instance
* know the available SDKs
    * Android, iOS, Javascript (browser)
    * Java
    * .Net
    * node.js
    * Ruby
    * PHP
    * Python
* default region for some SDKs is `us-east-1` (e.g. Java)
    * others force you to set a region before you can use them e.g. Node.js
    * Ruby

# S3

* is object based - you can store files but not install software (exam q)
    * you cannot install operating system or database on it
* data is stored across multiple devices and "facilities"
* files can be 1 byte to 5TB in size (exam q)
* files stored in buckets (exam q)
* storage is unlimited in theory (exam q)
    * in reality Amazon monitor how much storage is being used and add capacity if needed
* S3 has a _universal namespace_ so bucket names are universally unique (exam q)
    * if you register bucket "foo" it does not matter which region you used -
    others cannot use that name to register a bucket in any other region
* bucket names cannot contain uppercase characters
* your bucket url contains the region in its unique URL
* each bucket has a unique url `https://{region}.amazonaws.com/{bucket-name}`


S3 consistency model (exam q)

* READ after WRITE consistency for PUTS of new objects
    * you can read new objects immediately after uploading them
* eventual consistency for overwrite PUTS and DELETES
    * can take some time for changes to propagate after making changes or deleting a file
    * i.e. there might be a delay before your changes/deletion can be read
        * in practice this delay is usually ???
* S3 is a simple key-value store (think mongodb etc.)
    * each "object" in S3 contains 6 things
    1. key = name of object
    2. value = data (sequence of bytes
    3. version id
        * used for versioning
    4. metadata
        * data about the object
            * date created
            * date modified
    5. Access control lists
    6. Subresources
* Amazon garuantee 99.99% uptime (up to 52.6 mins downtime per year)
* Amazon garuantees 99.999999999% (11 9's) durabilty for S3 information
    * if you put 100 billion files on S3 you could lose 1 file and still be within the durability margin
* Tiered storage avaialble (exam q)
    * S3 storage tier
        * data stored redundantly across multiple facilities
        * can sustain the loss of two AZs
        * has "11 9's" durability
    * S3 infrequently accessed S3-IA
        * you have infrequent reads (e.g. monthly, 6 months, yearly) but they need to retrieved within a few seconds
        * is very new
        * has "11 9's" durability
        * cheaper than S3 but you pay a retrieval fee
    * RRS Reduced redunancy storage
        * provides 99.99% uptime and 99.99% durability over a given year
            * so if you upload 1000 files you could lose one
        * handy for data you can easily regenerate e.g. thumbnails of images
        * can only tolerate the loss of one AZ (as opposed to two AZ for normal S3)
    * Glacier
        * archival only
        * takes 3-5 hours to restore an object from glacier
* Lifecycle management
    * rules which move your objects between different storage tiers
* Versioning
* Encryption
* Secure your data with ACL and bucket policies
* S3 charges. Your S3 is charged on:
    1. storage
    2. requests
    3. data transfer pricing

* If you change the permissions on an individual file they will be reset the next time you overwrite that file
* You can change storage class for individual files
    * => not all files in the same bucket have to have the same storage class (Standard, Sandara-IA, Reduced Redundancy)

GOTCHA: S3 web hosting does not support HTTPS - you can setup cloudfront to do it if you need

Important Exam Q: Be able to tell the difference between a bucket URL and a website hosted link

```
# Bucket URL:
https://s3-{REGION_NAME}-amazonaws.com/{BUCKET_NAME}/{FILE_PATH}
# * note https only

# Website URL:
http://{BUCKET_NAME}.s3-website-{REGION_NAME}.amazonaws.com/{FILE_PATH}
# * note http not https
# * note bucket name is the subdomain, region is part of the domain name
```

Storage order/hot spots

* S3 stores files in alphabetical order (lexographical order)
* If you have a lot of files that have similar names e.g. log files with a timesamp prefix you will create a performance "hot spot"
    * they recommend salting your filenames to keep them more random and this will "spread the load across S3"

Exam Question: Maximum uploads

The largest file you can upload with PUT is 5GB - if you want to upload more than that you need to use multi-part upload

CORS

* CORS is not enabled by default on S3 buckets

default cors proxy configuration

```
<CORSConfiguration>
    <CORSRule>
        <AllowedOrigin>*</AllowedOrigin>
        <AllowedMethod>GET</AllowedMethod>
        <MaxAgeSeconds>3000</MaxAgeSeconds>
        <AllowedHeader>Authorization</AllowedHeader>
    </CORSRule>
</CORSConfiguration>
```

CORS config I used for an ember app

```
<?xml version="1.0" encoding="UTF-8"?>
<CORSConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
    <CORSRule>
        <AllowedOrigin>*</AllowedOrigin>
        <AllowedMethod>GET</AllowedMethod>
        <AllowedMethod>POST</AllowedMethod>
        <MaxAgeSeconds>3000</MaxAgeSeconds>
        <AllowedHeader>accept</AllowedHeader>
        <AllowedHeader>content-type</AllowedHeader>
        <AllowedHeader>origin</AllowedHeader>
    </CORSRule>
</CORSConfiguration>
```

Each CORS rule must contain

1. the set of origins/domains and HTTP methods you want to allow for those origins.
2. Optionally, you can also specify the headers users can set in requests or access in responses and the duration the preflight responses should be cached.

Versioning

* Stores all versions of an object including deletes
* Integrates with lifecycle
* Can force users to use 2FA to delete objects
* Once versioning is enabled it can NEVER be disabled - it can only be suspended. If you need to turn it off you need to delete the bucket and re-make it
* Versioning does nothing smart about storing files that are mostly the same - it simply stores another full copy of the file
* Cross region replication requires versioning to be enabled on both the source and target buckets
    * only replicates objects added to the bucket after it was turned on - it will not update existing files

Lifecycle management

* can be used with versioning or can be independnt of it
    * you can move older versions to other storage tiers
* transitioning to the S3-IA storage tier has requirements
    * files must be on S3 for 30+ days before being moved to S3-IA
    * S3-IA storage is set at object level not bucket level
    * minimum filesize is 128Kb - smaller objects are charged for 128 Kb storage
    * you can only move things from S3-IA to Glacier 30+ days after they have been in S3-IA
        * so there is 60+ days from first upload to hitting glacier
* You can go directly from normal S3 to glacier
* You cannot move things to (Reduced Redundancy Storage) RRS via lifecycle policies

Minimum storage durations

* AWS still wants to get paid even if your storage needs are very spiky so they use minimum storage durations
* S3-IA
    * Data that is deleted from S3-IA within 30 days will be charged for a full 30 days
* Glacier
    * Data that is deleted from S3-IA within 90 days will be charged for a full 90 days
    > If an object archived in Amazon Glacier is deleted or overwritten within
    > three months of being archived then there will be an early deletion fee.
    > This fee is prorated. If you delete 1GB of data 1 month after uploading it,
    > you will be charged an early deletion fee for 2 months of Amazon Glacier
    > storage. If you delete 1 GB after 2 months, you will be charged for 1 month
    > of Amazon Glacier storage.

Logging

* S3 can log all access to a bucket

Encryption

Two types

1. Transit
    * SSL/TLS
2. At Rest
    * Server side encryption
        * SSE-S3 S3 managed keys
            * AES-256
        * SSE-KMS AWS Key management service
            * provides an audit trail
        * SSE-C Server side encryption with customer provided key
    * Client side encryption
        * you encrypt the data on client and upload it to S3

Storage gateway appliances (are on exam)

* Gateway stored volumes
    * entire data set is stored onsite and is asynchronously duplicated to S3
* Gateway cached volumes
    * entire data set is stored in S3 and only the most recent stuff is stored on-site
* Gateway tape virtual library
    * replacement for tape based backup
    * used for backup
    * uses popular backup appliations like Net Backup, Backup Exec, Veam etc.

Import/export

* Import/export disk
    * lets you send amazon hard disks to import to AWS
    * can import _to_ 3 places
        1. Import to EBS
        2. Import to S3
        3. Import to Glacier
    * can only export _from_ one place
        1. export from S3
* Import/export snowball
    * Can only import/export to S3

# Cloudfront

* CDN lets you keep your content geographically close to your users
* Terminology
    * Edge location
        * the location where content will be cached (exam q)
        * there are 50+ edge locations currently
        * is NOT the same as a region or an availability zone
    * Origin
        * the origin of all files that the CDN will distribute - can be
            * S3 Bucket
            * EC2 instance
            * Elastic Load Balance with EC2 instances behind it
            * Route 53
                * TODO find out more -does this mean you could use cloudfront for stuff not on aws?
    * Distribution
        * A "CDN" which contains a collection of edge locations
* Steps
    * User hits URL for one of your assets that sends it to the edge location
    * file is not on the edge loation so the edge location will pull it from the origin and cache it
    * next user in that region will get it directly from that edge location
* Distributions can be used to deliver
    * static content
    * dynamic content
    * streaming traffic
    * interactive content (what is this?)
* works well with other AWS services (route53, ELB, EC2 instances, S3)
* works well it non AWS origin server
* Types of distribution
    1. Web distribution
        * for web content
    2. RTMP distribution
        * for streaming flash media
        * RTMP is an adobe flash protocol
* nearest edge location to NZ seems to be Sydney
* Edge locations are not just read-only! users can upload data through them too!
* Objects are cached for the life of the TTL (Time to Live)
* You can clear cached objects manually but you will be charged for it


Creating a distribution


* origins can be
    1. S3 bucket root
    2. a folder within an S3 bucket
* users can upload data via cloudfront
    * user uploads data to cloudfront (via HTTP POST PUT PATCH DELETE)
    * cloudfront stores the upload and then uploads it to your origin server
* TTL values are always in seconds
    * default TTL is 86400 seconds (1 day)
        * => how long cloudfront will go before updating data from origin
* AWS WAF Web ACL
    * WAF = Web application firewall
    * you can use a firewall to secure your content
        * TODO: find out more
* distributions can take 5-10 mins to be created
* Exam Question: you can have multiple origins in a distribution
    * => you can have a single cloudfront distribution that is a front from multiple S3 buckets
* you can use the "path pattern" regex to route requests to different origins within your distribution based on the URL e.g. all pdf files come from a particular bucket
* you can geo-restrict your content based on country
    * uses a whitelist or a blacklist
    * how does that work?
* "invalidations"
    * you can create an invalidation to remove files from the cache without waiting for a TTL to expire
    * IMPORTANT: you get some free validations each month but you pay for each invalidation you create after that
    * versioning objects via a filename fingerprint is a better way to go in general
        * the logs show accesses to old and new files
* S3 Transfer acceleration
    * Uses cloudfront edge location to accelerate uploads
    * Upload goes to the cloudfront edge location and then from there to your S3 bucket
        * you get a separate URL to upload to your bucket via S3 transfer acceleration
            * `{BUCKET_NAME}.s3-accelerate.amazonaws.com`
    * it does cost more money than normal uploads
        * there is a speed comparison page

# Databases services

* Two types of database processing
    * OLTP Online Transaction Processing
    * hits the DB lightly
* OLAP Online Analytics Processing
    * analyse a large volume of data
    * often a copy of the production DB
        * uses a totally differnt architecture and storage (e.g. columnuar) that the OLTP copy

1. RDS
    * Relation/SQL database
    * OLTP type database
    * Supports 6 databases (exam q)
        1. Postgres
        2. MySQL
        3. Oracle
        4. MariaDB
        5. Aurora
        6. MS SQL Server
    * not a huge amount about RDS in the exam
2. DynamoDB
    * Managed NoSQL service
    * Document oriented database
    * the most important topic on the exam!
3. Elasticache
    * in-memory cache service
    * supports
        1. memcached
        2. redis
4. Redshift
    * data warehouse
    * competitors
        * Cognos
        * Jaspersoft
        * SQL Server Reporting Services
        * Oracle Hyperion
        * SAP NetWeaver
    * used to run long-running queries on very large data sets
5. managed database migration service
    * moves views, triggers etc. too!!!


## DynamoDB

    Hint: DynamoDB is the most important topic on the exam

* supports document and key-value stores
* "single digit millisecond latency
* is a fully managed database
    * you can't ssh into the VM it runs on
* stored on SSD
* stored across 3 "geographically distinct" data centers
    * writes are written frist to one location and the replicated to the other two
* there are two types of reads
    1. eventual consistent reads (the default)
        * consistency across all copies of data is usually reached within a second
        * faster read perf than strongly consistent reads
    2. strongly consistent reads
        * a strongly consistent read returns a result that reflects all the
          previous writes that received a successful response
        * slower read perf than eventually consistent reads
* database structure
    * tables
        * contain items (akin to rows in SQL table)
            * contain attributes (akin to column values on a SQL table)
* pricing
    * charged by
        1. throughput
        2. storage
            * first 25GB per month is free
            * storage is $0.25/GB/month after that

Keys

1. Single attribut primary key
    * Partition key (also called Hash Key) composed of one attribute
        * DynamoDB uses the partition key as the input to a hash function that
          returns the "partition" (the physical location in which the data is
          stored)
        * Partition key values MUST be unique in a table
2. Composite attribute primary key
    * Made up of "Partition key" (used to be called "Hash key") and "Sort key"
      (used to be called "Range key") composed of two attributes
        * DynamoDB uses the partition key as the input to a hash function that
          returns the "partition" (the physical location in which the data is
          stored)
        * two items can have the same partition key value but if they do they
          must have different sort keys
        * all items with the same partition id will be stored together in the
          order sorted by the sort key value

Indexes

Local secondary index
    * The index has the same partition key, different sort key
    * Can ONLY be created when creating a table - it cannot be removed or modified later
    * Can only have up to 5 LSIs on each table
Global secondary index
    * Can be created at table creation or added later
    * The index has a different partition key and a different sort key
    * Can only have up to 5 GSIs on each table

Streams

Used to capture any modification to the table

* On item create
    * the stream captures an image of the entire item including its attributes
* On item update
    * it captures before AND after images of the item
* On item delete
    * captures an image of the item before delete

* streams store data for a maximum of 24hrs
* can configure a trigger that tirggers a lambda function which can do whatever with it

Query operation

* finds items in the table using only the primary key attribute values
    * you must provide a partition attribute name and a distinct value to search for
* can optionally provide a sort key attribute name and value and use comparison operator to refine the search
* by default, query returns ALL the data attributes for items with the specified primary keys
* can use the _ProjectionExpression_ parameter so that the Query only returns the attributes you provide
* query results are always sorted by the sort key
    * sort order is numeric if sort key is a number
    * sort order is ASCII character code
    * default sort order is asending
    * can provide `ScanIndexForward` paramter to `false` to get descending order
        * note that despite the name, this parameter is only used on queries
* by Default is eventually consistent

Scan operation

* examines every item in the table
* returns all the data attributes for every item
* can use `ProjectionExpression` to choose a subset of attributes
* avoid using it on large table with a filter that removes many attributes
* scans can be very expensive because they can use up all your provisioned throughput in one go if the table is large

Table design tips

* for quick response times design tables so you can use Query, Get, BatchGetItem APIs insteand of scan

Calculting provisioned throughput (an exam topic)

* DynamoDB measures read and write capacity and usage in "units"

Things you need to know before you calculate

1. How large is each item (aka "row")in the table in KB?
2. How many items per second will you need to read?

* Units of read provisioned throughput
    * All item reads are rounded up in increments of 4KB e.g. 1KB item => 4KB, 5KB item => 8 KB
    * Eventually consistent reads (default) consist of 2 reads per second
    * Strongly consistent reads are 1 read per second
    * a "unit" is a 4KB item read every 500 mS for eventually consistent reads
    * a "unit" is a 4KB item read every 1 S for strongly consistent reads
* Units of write provisioned throughput
    * all writes are 1KB
    * all writes consist of 1 write per second
    * a write "unit" is a single 1KB write each second

The read throughput formula

```
(read_size_rounded_to_nearest_4KB / 4KB) * num_of_items = read_throughput_in_units

Then divide by 2 if eventually consistent
```
Remember: an "item" is a "row" in the table

Write throughput formula

```
num_of_items * item_size_in_KB = write_throughput_in_units
```

If you exceed your read or write provisioned thorughput capacity for

1. a table
2. a global secondary index

you will get a HTTP 400

```
HTTP 400 ProvisionedThroughputExceededException
```

Web identity providers with DynamoDB

* you can authenticate a user using any provider that provides OpenID connect e.g. Amazon, Facebook, Google

1. User authenticates with the identity provider e.g. Facebook
1. User is given a token by their identity provider
1. Your code calls the `AssumeRoleWithWebIdentity` API passing
    * the identity provider token
    * the ARN for the IAM role that should be assumed
1. AWS STS (security token service) issues you with temporary security credentials
    * response contains
        1. (access key ID, secret access key, session token)
        2. expiration (time limit)
            * access is valid from 15mins to 1hr (defaults to 1hr)
        3. AssumeRoleID
        4. SubjectFromWebIdentityToken

Conditional writes

write new value to the DB if the old value is what I expect it to be
* if two processes try to write at the same time then one will fail because the value will not have the expected "old value"
* conditional writes are idempotent!
    * it doesn't matter how many times you send the write req, DynamoDB will only update it once

Atomic counters

* supports atomic counters
    * you use the `UpdateItem` API request to increment/decrement a value without interfering with other writes
    * these are "increment the value no matter what its current value is"
    * it's an update you want to do no matter what the current value is
    * atomic counters updates are NOT idempotent
* all write requests are applied in the order they are received

Batch operations

* can read multiple items in one request with `BatchGetItem` request
    * note the API name is singular (this comes up in exam)
* a single batch get can read up to 1MB of data and include up to 100 items
* a single batch get can read items from multiple tables

# SQS

* was the first AWS service launched
* a web service that provides a message queue that can store messages
* allows for distributed applications where some service(s) create messages and others consume/process them
* a queue is a temporory repository for messages awaiting processing
* queues are "fail safe" ???
* messages can be up to 256KB (this is an exam question)
* queue acts a a buffer between producer and consumer
* allows producer and consumer to be only intermittantly connected to the network
* allows producer to create messages more quickly than the consumer can process them
* sqs ensures delivery of the message at least once
* supports multiple readers and writers working on the same queue
* SQS does NOT garuantee first-in first-out delivery of messages
    * if you need to enforce order you must include some sequencing info in the message and have your consumer re-order messages as it receives them
* SQS queues never push messages - it is always pulled by the consumer e..g your EC2 instance must poll for messages


1. producer service sends a message to the queue
1. consumer service pulls the messsage from the queue
1. the "visibility timeout clock" starts once the message has been pulled by a consumer

1. consumer must finish its work and delete the message from the queue within the visibility timeout for the message to be considered "delivered"

* SQS can do autoscaling based on queue length
* you should design your system so that messages are idempotent i.e. it won't matter if they are processed more than once


* pricing
    * is charged in "requests" not in "messages"
    * each request can have up to 10 messages or 256KB data
    * first 1 million SQS requests each month are free
    * $0.50 per 1 million SQS request per month after that

* each 64KB "chunk" of payload is billed as 1 request e.g. a single API call with a 256KB payload is billed as 4 requests

exam tips

* SQS messages can be delivered multiple times and in any order
* you can make priorities by having multiple queues that your app pulls from
* SQS default visibility timeout is 30 sec by default (max is 12hrs)
* while processing a message (as a consumer) you can give yourself more time by sending the `ChangeMessageVisibility` API call and SQS will restart the timer with the new value
* Short polling returns immediately even if the queue is empty
* Long polling will return immediately if there are messages but will wait up to its timeout for a message to turn up if the queue is empty
    * Maximum long poll timeout is 20 sec
    * Long polling lets you save money on request

* Fanning out
    1. Create an SNS topic
    1. create and subscribe multiple SQS queues to the topic
    1. then when a message is sent to the SNS topic it will be passed on to each subscribed SQS queue

# SNS Simple Notification Service

* allows you to deliver messages from the cloud to "subscribers" and other applications
* instantaneous push based messages
    * this is a key difference between SNS and SQS - SNS pushes messages, SQS is pull only
* the data format of SNS is JSON
* is a pub-sub service
* pay as you go pricing
* will push messages to the following endpoint types
    1. Apple devices
    2. Android devices
    3. Amazon fire devices
    4. Baidu devices in china
    5. SQS (you can use SNS to inject messages into SQS)
    6. Text messages
    7. Email
    8. Any HTTP endpoint
* protocols (exam Q)
    1. Email
    2. Email-JSON
    3. Application
    4. Amazon SQS
    5. HTTP
    6. HTTPS
* messages can be customised for each protocol (exam Q)
* All messages are stored redundantly across many zones
* topics
    * allow you to group multiple recipients
    * a message sent to a topic is delivered to all subscribers to the topic
    * a topic can deliver to multiple endpoint types e.g. you can put all your iOS and Android users in the same topic

* pricing
    * $0.50 per 1 million Amazon SNS requests
    * $0.06 per 100k deliveries over HTTP
    * $0.75 per 100 deliveries over SMS (NOTE: 100, not 100k here!)
    * $2.00 per 100k deliveries over Email

# SWF Simple Workflow Service

* lets you coordinate work across different application components
* Amazon use SWF to fulfil orders from Amazon.com
* task
    * a task is the invocation of a processing step
    * a task can be performed by
        1. executable code
        1. web service calls
        1. humans
        1. scripts
* work is split into "workers" and "deciders"
* worker
    * a program that interacts with SWF to get tasks, processes the task and returns a result
    * can run on AWS cloud or on machines behind firewalls
* decider
    * a program that controls the coordination of tasks i.e. their ordering, concurrency, sheduling according to the application logic
    * can run on AWS cloud or on machines behind firewalls
* SWF brokers the interactions between workers and deciders
    * since SWF keeps track of applicaiton state durably the workers and deciders don't have to know about the application state so they can run independently and scale more easily
* SWF ensures a task is assigned only once and never duplicated
    * this is a key difference between SQS and SWF (also an exam Q)
* Domain
    * scopes your workflow, activity types and the workflow execution
    * isolates a set of types, task-lists and executions from others in the same account
    * can register a domain via the console or via the `RegisterDomain` API
* maximum workflow is 1 year and is measured in seconds (exam Q)
* SWF vs SQS
    * SWF is task oriented, SQS is message oriented
    * SWF assigns a task only once, SQS may deliver message multiple times
    * SWF keeps track of all the tasks and events in an application, SQS you have to implement your own appliation tracking logic
* exam tips
    * if the question involves humans you need SWF not SQS
    * if it might take longer than 12hrs to cmplete you need SWF not SQS

# Cloud formation

* lets you script creating infrastructure aka create "virtual data centers"
* using cloudformation is free but you do pay for the resources that it creates (exam Q)
* CF templates are JSON documents (exam q)
* CF templates
    * JSON format
    * can include function calls e.g. `value: { "fn::GetAtt": ["BackupLoadBalancer", "DNSName"] }
* you can define "outputs" in the script which let you expose data to the user e.g. the URL of an S3 bucket, the DNS name of a load balancer etc.
    * the "Fn::GetAtt" function is used to read attributes of the services you are setting up with the script for display in outputs (exam Q)
* by default it will rollback (delete all provisioned resources) if there is an error in your script

# Elastic Beanstalk

* command line tools
    * `aws elasticbeanstalk`
        * the general AWS-CLI tool has some commands for EB
    * `eb help`
        * there is a specific elastic beanstalk CLI tool (`brew install aws-elasticbeanstalk`)
* very similar to Heroku
* you pick a "platform" aka application type and
    1. upload a zip file of your code
    2. upload your code to S3
* platforms (exam Q)
    * Node
    * Go
    * Ruby
    * Python
    * PHP
    * Tomcat
    * IIS
    * Java
    * Docker
    * Docker with multiple containers
    * Docker + Go
    * Docker + Glassfish (Oracle OSS J2EE appliation server)
    * Docker + Python
* you don't pay for EB but you do pay for the resources it creates (exam Q)

# Virtual Private Cloud (VPC)

* most important thing in the exam
* need to be able to build a VPC from memory
* by default you get a VPC based on region when you log in

* VPC is a logically isolated section of the AWS cloud
* you can
    * create your own subnets
    * launch instances into a particular subnet
    * configure route tables between subnets
    * create internet gateways and attach them to subnets
    * choose your own IP ranges
    * create subnet network access control lists (ACLs)
    * create "instance security groups"
* can create public facing subnets for web servers
* can create appliaction servers and DB servers in private subnets
* can create a hardware VPN connection between your VPC and your existing corporate datacenter
    * allows you to extend your data center with your VPC
    * this is called "hybrid cloud"

* default VPC
    * user friendly
    * allows you to immediately deploy instances
    * all subnets have an internet gateway attached
    * each EC2 instance has a public and private IP address
    * WARNING: if you delete the default VPC the only way to get it back is to contact AWS
        * you can just change region
    * I seem to have a different default VPC configured in each AWS region
* VPC peering
    * can connect VPCs to each other via a direct network route using private IP addresses
    * instances behave as if they are on the same private network
    * You can peer VPCs with other AWS accounts
    * You can peer VPCs with other VPCs in the same account
    * peering is always done in a star configuraiton (with 4 points)
    * NB: you cannot do transative peering

* By default you can have up to 5 VPCs in each region (exam Q)
    * I assume you can contact support for more ???

Aside: CIDR = classless inter domain routing

* Creating a VPC
    * options
        * name - add a name tag to the VPC
        * CIDR block - the IP range to assign to this VPC e.g. 10.0.0.0/16, 192.168.0.0/16
            * mask sizes must be between /16 (65536 hosts) and /28 (8 hosts)
        * Tenancy
            * Dedicated
                * lets you specify that instances in this VM should always use
                single tenant dedicated hardware no matter what their launch
                options are configured as
                * a lot more expensive
            * Default
                * Your VM instances use whatevery tenancy you choose when launching them
    * creating a new VPC also creates
        * creates a new route table called "main"
            * this route table seems to only allow local traffic between instances in its CIDR block
        * creates a new network ACL
        * re-uses the existing DHCP options set
    * Aside: you can create a "flow log" which will log IP traffic to cloudwatch from your various VPCs network interfaces
* subnets
    * subnets area ALWAYS in a single availability zone (exam Q)
    * subnets can only be associated with one route table at a time
    * when you create a subnet you can choose which AZ in the region you want it to be in
        * but even if you don't, AWS will choose one for you
* You can only have ONE internet gateway per VPC (important exam Q)
* When you create an internet gateway it is not attached by default

To make a subnet be publically accessible

1. create a new route table and add a route that will allow all traffic from attached subnets to a chosen IGW
    * target: the internet gateway of your choice
    * source: 0.0.0.0/0
2. Associate the subnet with the route table



A "security group" can stretch across different AZs but a subnet cannot (exam Q)

EC2 instances source/destination check (this is important exam Q)

* by defaults EC2 instances have a "source/destination check" enabled
* this checks that the instance is either the source or destination of IP packets that flow through it i.e. it prevents it from being a NAT
* You need to disable this check via _Instance settings -> Networking_ if you are setting up a NAT instance
* comes up in exam giving you a scenario where your nat should work but doesnt buecause of source/destination check

He called the instance with the public IP that we ssh'd into to then ssh into the private instance a "bastian host"


Network Access Control Lists

* act a bit like a firewall
* apply rules to a whole subnet
* overrides rules from a security group
* Security groups act like a firewall at the instance level whereas NACLs are an additional layer of security that act at the subnet level
* an ACL is
    * a numbered list of rules
    * rules are evaluated in order starting with lowest numbered rule (exam Q)
    * determines whether traffic is allowed in or out of any subnet associated with the ACL
    * highest number is 32766
    * suggest start with rules which are multiples of 100 to allow gaps for editing
    * each VPC comes with a modifiable default ACL
    * default ACL allows all inbound and outbound traffic
    * custom ACL start as fully closed (permits no traffic) by default
    * each subnet must have only one ACL
        * if you deassociate a custom NACL with a subnet the subnet will automatically be put back in the default NACL
    * each NACL can have 0-N subnets
    * each NACL must live in a VPC (they cannot span VPCs)
    * ACLs are stateless!
        * e.g. they can't allow a response in based on some previous request out
    * each subnet MUST be associated with a ACL
        * i fyou don't explicitly associate an ACL the default one will be used

QUESTION: how do ACL and security group interact


## Shared responsibility model

* Aside: amazon use Xen as their hypervisor
* Aside: Amazon include RDS in their "container services"

* Amazon is responsible for the lower levels and you (cstomer) are responsibile for higher level
* Amazon defines three levels of shared responsibility
    1. infrastructure services e.g EC2
    2. container services e.g. RDS
    3. abstracted services e.g. S3, lambda

## Exam

* 80 minutes
* 55 questions
* $150 USD
* be 15 mins early
* register online beforehand and give the accessor the code
* need to provide two forms of ID (one must be govt issued)
* exam rescheduling within 72hrs will incur a penalty (normally 50% of exam fee)
* exam pass mark is not published but can change (is approx 65%)


## misc exam q

It is possible to transfer a reserved instance from one Availability Zone to another. = TRUE
Amazon S3 buckets in all other regions (other than US Standard) provide read-after-write consistency for PUTS of new objects. = TRUE
    TODO: is there something odd about us-standard region for S3???
You can have multiple SSL certificates (for multiple domain names) on a single Elastic Load Balancer. = TRUE
Default region for all SDKs is US-East-1 (not US-West-1
If you make an AMI public, this AMI is immediately available across all regions, by default. = FALSE



