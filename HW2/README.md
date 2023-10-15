# Requested information

- Class homepage: http://gmu-swe-645-aphill5.s3-website-us-east-1.amazonaws.com
    - Navigate to the "Homework" section
    - You will see a table with heading "Assignment 2"
    - Click on, and navigate to the survey link. Same as below
- Survey page: http://54.242.37.7:31231/HW1-Part2/
    - If you are unable to access the information, that means that AWS academy has stopped the
      instances after the 4-hour period. **Therefore**, please look at the recorded video.

# Deploying a containerized WAR application on a K8s cluster via Jenkins

## Prerequisites

Before you begin, ensure you have the following:

- An AWS account.
- AWS Command Line Interface (CLI) installed on your local machine.
- **EC2 Key Pair:** Create an EC2 key pair and note down the key pair name (e.g., 'hw3').

# AWS CloudFormation Template Deployment Guide

To help me with the instance creation throughout this homework, I created, and refined
this CloudFormation template

This guide will walk you through deploying the provided CloudFormation template to create three EC2 instances with
Docker installed in your AWS account using the AWS Management Console.

Follow these steps to deploy the CloudFormation template:

1. **Sign in to AWS Console:** Go to the [AWS Management Console](https://aws.amazon.com/console/) and sign in to your
   AWS account.

2. **Open CloudFormation:**
    - In the AWS Console, navigate to the "Services" menu and select "CloudFormation"
      under the "Management & Governance" section.

3. **Create a New Stack:**
    - Click the "Create stack" button.
    - Choose "With new resources (standard)" and click "Next" at the bottom of the page.

4. **Specify Template:**
    - Choose "Upload a template file."
    - Click the "Choose file" button, and then select the `template.yml` file from the zip file that is provided.
    - Click "Next" at the bottom of the page.

5. **Specify Stack Details:**
    - Stack name: Enter a unique name for your CloudFormation stack (e.g., "Aphillip-HW2").
    - KeyName: Enter the name of your EC2 key pair (e.g., "hw3").
    - Click "Next" at the bottom of the page.

6. **Review:**
    - Review the stack details to ensure they are correct.

7. **Create the Stack:**
    - Scroll to the bottom of the page and check the box for "I acknowledge that AWS CloudFormation might create IAM
      resources."
    - Click the "Create stack" button.

8. **Monitor Stack Creation:**
    - You will be redirected to the CloudFormation stack details page.
    - Refresh the page periodically to check the stack's status. Wait until the stack status changes to "
      CREATE_COMPLETE."

9. **Accessing EC2 Instances:**
    - After the stack is created successfully, go to the AWS EC2 Console.
    - Under "Instances," you will find the EC2 instances created by the CloudFormation stack.
    - You can connect to these instances EC2 Instance connect

That's it!
Instance 1 named Rancher, will come with Rancher and Docker installed.
Instance 2 named k8s, will only have Docker installed, and
Instance 3, will have Docker, kubectl, Java, and Jenkins installed.

# Setting up Rancher, and Creating a K8s cluster

I followed the same instruction in the presentation slides named "**Lec7 - K8s Cluster Management with Rancher and GCP
**"

# Setting Up Jenkins for Pipeline Deployment

To set up Jenkins for deploying applications using the provided Jenkinsfile, follow these steps:

1. **Install Required Tools:** Ensure that the following tools are available on the Jenkins server:
    - Docker
    - Java Development Kit (JDK) 17
    - Maven 3.6.3

2. **Configure Jenkins Credentials:**
    - Create Jenkins credentials for Docker login.
    - Note down the credentials ID (e.g., 'af3bf4df-c402-4c86-8367-03bb2c9e5884').

3. **Configure Environment Variables:** In Jenkins, configure the following environment variables:
    - `JAVA_HOME`: Set it to the path of JDK 17 (e.g., '/usr/lib/jvm/java-17-openjdk-amd64').
    - `DOCKER_CREDENTIALS`: Set it to the credentials ID you created.

4. **Create a Jenkins Pipeline:**
    - Create a new Jenkins Pipeline job.
    - In the pipeline configuration, use the provided Jenkinsfile for the pipeline script.

## About the Jenkinsfile

The provided Jenkinsfile is a declarative Jenkins Pipeline that automates the build and deployment process for my HW2
application.
Here's an overview of what it does:

- **Agent:** The pipeline can run on any available agent.
- **Environment Variables:**
    - `DOCKER_CREDENTIALS`: Defines the Docker credentials ID for Docker login.
- **Tools:** Specifies the required tools (Maven and JDK) for the pipeline stages.
- **Stages:**
    1. **Docker Login:** Logs in to Docker using the specified credentials.
    2. **Build WAR:** Sets the `JAVA_HOME` environment variable and builds the application using Maven.
    3. **Build Docker Image:** Builds a Docker image using the Dockerfile in the 'HW1-Part2' directory. (Also present in
       the zipped file)
    4. **Push Docker Image:** Pushes the Docker image to a Docker registry.
    5. **Deploy to Kubernetes:** Modifies the Kubernetes deployment YAML to use the new Docker image tag and deploys the
       application to Kubernetes.

This Jenkinsfile automates the process of building, packaging, and deploying my application to Kubernetes whenever
changes are made to the codebase.

## About the `deployment.yml` File

The `deployment.yml` file defines the Kubernetes Deployment and Service resources used for deploying and exposing my
application within a Kubernetes cluster.

### Deployment Resource

- **metadata.name**: Defines the name of the Deployment resource.
- **spec.replicas**: Specifies the desired number of replica Pods (in this case, 3).
- **spec.selector**: Defines a label selector to match Pods controlled by this Deployment.
- **spec.template**: Describes the desired state for the Pods.
    - **metadata.labels**: Labels applied to the Pods.
    - **spec.containers**: Specifies the container configuration, including the Docker image (
      akshathphillipspersonal/swe645:v21) and the container port (8080).

### Service Resource

- **apiVersion** and **kind**: These fields specify the Kubernetes resource type and version.
- **metadata.name**: Defines the name of the Service resource.
- **spec.type**: Specifies the Service type as NodePort, which exposes the service on each Node's IP address at a
  specific port.
- **spec.selector**: Selects the Pods to expose based on their labels (matches the app: hw2-app-label label).
- **spec.ports**: Configures the ports for the service:
    - **protocol**: Specifies the protocol (TCP).
    - **port**: Defines the port through which the service is accessible externally (8080).
    - **targetPort**: Specifies the target port on the Pods (8080), which should match the container port of the
      application.
