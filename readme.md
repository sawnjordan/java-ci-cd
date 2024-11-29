Simple Spring Boot App
======================

A minimal Spring Boot application demonstrating CI/CD.

Getting Started
---------------

1. Install Java 17 or later.
2. Clone the repository.
2. Run `./mvnw spring-boot:run` to run the app.
4. Access the app at <http://localhost:8080>.
5. Simple GET request at <http://localhost:8080/welcome>.

## Terraform config

### Install AWS CLI

As the first step, you need to install AWS CLI as we will use the AWS CLI (`aws configure`) command to connect Terraform with AWS in the next steps.

Follow the below link to Install AWS CLI.
```
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
```

### Install Terraform

Next, Install Terraform using the below link.
```
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
```


### Connect Terraform with AWS

Run `aws configure` command and provide the AWS Security credentials as shown in the video.
### Initialize Terraform

Go to `terraform-config` folder and run `terraform init`. This will intialize the terraform environment for you and download the modules, providers and other configuration required.

You can create `dev.tfvars` for development cluster and `prod.tfvars` for production cluster.

### Optionally review the terraform configuration

Run `terraform plan` to see the configuration it creates when executed.

### Finally, Apply terraform configuation to create EKS cluster with VPC

`terraform apply`

## Application deployment on cluster via Helm

Be on the root folder of the repo and after you are on the required dev/prod cluster you can run `helm install demo-char --debug --dry-run task-demo-helm-char` to see the manifest yaml files.

And to install the chart run `helm install demo-char /task-demo-helm-char`
