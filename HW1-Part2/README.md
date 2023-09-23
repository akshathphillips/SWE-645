# Requested information
- Class homepage: http://gmu-swe-645-aphill5.s3-website-us-east-1.amazonaws.com
   - Navigate to the "Homework" section
   - You will see a table with heading "Assignment 1"
   - Click on, and navigate to the survey link. Same as below
- Survey page: http://ec2-52-90-71-203.compute-1.amazonaws.com:8080/HW1-Part2/

# Deploying the CS Survey WAR on EC2

This README.md file provides high-level steps to create an EC2 Linux 2, installing Tomcat, and deploying the WAR file. When creating an instance using the "Tomcat Certified by Bitnami" I was NOT able to connect to it both via SSH, and WinSCP.

## Prerequisites

Before you begin, ensure you have the following:

- An AWS account.
- AWS Command Line Interface (CLI) installed on your local machine.

## Steps to Launch an EC2 Instance

1. **Sign In to AWS Console**
   - Open a web browser and navigate to the [AWS Management Console](https://aws.amazon.com/console/).
   - Sign in with your AWS account credentials.

2. **Launch EC2 Instance**
   - In the AWS Management Console, navigate to the EC2 service.
   - Click on the "Launch Instance" button.

3. **Choose an Amazon Machine Image (AMI)**
   - Select "Amazon Linux 2 AMI" as the desired AMI. The one that says free tier

4. **Configure Security Group**
   - Create a new security group or use an existing one.
   - Ensure that the security group allows inbound traffic on the following ports:
      - SSH (Port 22) for secure shell access.
      - HTTP (Port 80) for web traffic.
      - HTTPS (Port 443) for secure web traffic.

5. **Create Key Pair**
   - If you don't have an existing key pair, select "Create a new key pair."
   - Enter a name for the key pair.
   - Download the private key (.pem file) and keep it in a secure location.

6. **Launch the Instance**
   - Confirm your key pair selection and acknowledge that you have access to the private key.
   - Click "Launch Instances."

7. **Access Your EC2 Instance**
   - Once your instance is running, select it from the EC2 dashboard.
   - Note the instance's public IP address or DNS name.

8. **SSH into the Instance**
   - Open a terminal on your local machine.
   - Use the following command to SSH into your EC2 instance, replacing `<your-instance-IP>` with the actual IP address:
     ```
     ssh -i /path/to/your-key-pair.pem ec2-user@<your-instance-IP>
     ```

# Java and Tomcat Setup with WAR Deployment on EC2

## Prerequisites

- An active AWS account.
- An EC2 instance running Amazon Linux 2.
- An SSH Key Pair associated with the EC2 instance for secure connections.
- A WAR file to be deployed on the server.
- SSH into the server based on step 8 above.

## Steps to install Java, Tomcat, and Deploy WAR

1. **Update the System**

   It's always a good practice to update the system packages to the latest version.

    ```
    sudo yum update -y
    ```

2. **Install Java**

   Install Java OpenJDK 11 from the amazon-linux-extras repository.

    ```
    sudo amazon-linux-extras install java-openjdk11 -y
    java -version
    ```

3. **Download and Setup Apache Tomcat**

   Download Apache Tomcat version 10.1.13 from the official website, extract the archive, and create a symbolic link for easier access.

    ```
    wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.13/bin/apache-tomcat-10.1.13.tar.gz
    sudo tar -xzvf apache-tomcat-10.1.13.tar.gz -C /opt/
    sudo ln -s /opt/apache-tomcat-10.1.13 /opt/tomcat
    ```

4. **Update Environment Variables**

   Update your .bashrc file to include the CATALINA_HOME and PATH environment variables. This step makes it easier to manage Tomcat.

    ```
    echo 'export CATALINA_HOME=/opt/tomcat' >> ~/.bashrc
    echo 'export PATH=$PATH:$CATALINA_HOME/bin' >> ~/.bashrc
    source ~/.bashrc
    ```

5. **Start Tomcat**

   Start the Apache Tomcat server.

    ```
    sudo $CATALINA_HOME/bin/startup.sh
    ```

6. **Upload WAR file to EC2 instance**

   Using SCP (Secure Copy Protocol), upload your WAR file from your local machine to the EC2 instance. Replace the paths and filenames with your actual paths and filenames.

    ```
    scp -i "/path/to/your-key-pair.pem" /path/to/your/war/HW1-Part2.war ec2-user@<your-instance-IP>:~
    ```

7. **Deploy WAR file**

   Move the WAR file to the Tomcat's webapps directory to deploy it.

    ```
    sudo mv ~/HW1-Part2.war /opt/tomcat/webapps/
    ```

8. **Restart Tomcat**

   Restart Tomcat to ensure that the new application is loaded and served.

    ```
    sudo $CATALINA_HOME/bin/shutdown.sh
    sudo $CATALINA_HOME/bin/startup.sh
    ```

## Conclusion

You have successfully set up Java, Apache Tomcat, and deployed a WAR file on your EC2 instance. You can now access your application via the EC2 instance's public IP address or domain name followed by the context path of your application. Example: http://ec2-52-90-71-203.compute-1.amazonaws.com:8080/HW1-Part2/
