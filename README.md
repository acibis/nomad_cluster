# CREATE NOMAD CLUSTER AND RUN SIMPLE JOB

### Welcome! If you want to create a simple Nomad(+Consul) cluster with Posgtres DB and run a simple job, just follow these steps:

#### PREREQUISITES

1. Go to directory **terraform-aws-nomad**

2. Create a .pem key

```
# generate an RSA key of size 2048 bits
ssh-keygen -t rsa -b 2048 -f nomad.key -C
```
3. Get your .pub key
```
ssh-keygen -f /tmp/nomad.pem -y > nomad.pub
```
4. Open variables.tf file, fill in the blanks (ssh public key and yor IP address) and change whatever variables you feel like changing (p. ex. instance type to get more powerful cluster, or name to get a fancy vibe)

#### CREATING A CLUSTER

1. Run `terraform init`.
2. Run `terraform apply`. If you run into this error:
>│ Error: Provider produced inconsistent final plan
│
│ When expanding the plan for module.nomad_cluster.aws_autoscaling_group.nomad_servers to include new values learned so far during apply, provider "registry.terraform.io/hashicorp/aws" produced an invalid new
│ value for .availability_zones: was known, but now unknown.
│
│ This is a bug in the provider, which should be reported in the provider's own issue tracker.

don't worry, just run `terraform apply` once again.

3. Get the terraform output.

#### CREATE DATABASE
1. Go to db directory.
2. Open variables.tf file and fill in missing values (vpc_security_group_ids) that you received from terraform output in the previous step.
3. Run `terraform init` and `terraform apply`
4. Get the terraform output.

#### CREATE A JOB IN NOMAD
1. Go to your browser. Check your aws ec2 console and get a public ip from one of Nomad Servers. Open nomad gui at http://server_public_ip:4646
2. Go to jobs -> run job.
3. You can find the job specification in nomad_cluster/terraform-aws-nomad/nomad_job directory. Fill the missing value with the terraform output from the previous (create database) step, remove the port (:4646).
4. Copy-paste the job spec to the job definition section in the Nomad GUI, plan and run. Once it's deployed, go to allocations and find the addess the job is running on. Change the private IP to the public one (found in aws ec2 console) and check if the job is really running:

![image](https://user-images.githubusercontent.com/13216011/147302837-2052822e-78b6-4bc4-8983-af7ca22cf15c.png)


### WHAT COULD BE DONE BETTER?

- The arguments and outputs could be put in one piece of code, in the manner where only one iteration of `terraform apply` is needed. Including the job definition.
- Passwords could be encrypted or kept in the vault
- Network configuration could be altered.
- Database should be configured so the job can write and read properly.

#### Used modules
 - terraform-aws-modules/vpc/aws
 - https://registry.terraform.io/modules/hashicorp/nomad-starter/aws/latest?tab=outputs
security_groups.tf file was altered, so the database can interact with nomad and so I can interact with the cluster from my laptop

