Installation Instructions

Step 1: Clone the Repository

Clone the project to your local machine:
git clone https://github.com/YourRepo/mern-aws-deployment.git  
cd mern-aws-deployment  

Step 2: Configure Terraform

1. Initialize Terraform:terraform init    
2. Update the terraform.tfvars file with your AWS details, SSH key, and other required variables.
3. Apply the Terraform configuration:terraform apply    
4. Confirm the changes to create AWS resources.
Step 3: Verify Infrastructure

* Check the AWS Management Console to ensure resources (VPC, subnets, EC2 instances, and security groups) are provisioned.
* Verify the dynamic Ansible inventory file (inventory.yml) is generated in the ansible directory.
Step 4: Run Ansible Playbooks

1. Navigate to the ansible directory:cd ansible    
2. Execute the playbooks:ansible-playbook -i inventory.yml playbooks/deploy_app.yml    

Usage Instructions

Access the Application

* Use the public IP of the web server to access the application:http://<web-server-public-ip>  
*   
Test the Frontend

* Verify the React frontend communicates with the backend.
Test the Backend

* APIs are accessible at:http://<web-server-public-ip>:3001  
*   
Verify the Database

* MongoDB is running on the private EC2 instance and accessible from the backend.

Documentation

Infrastructure Details

1. VPC:
    * Public subnet for the web server.
    * Private subnet for the database server.
    * Internet Gateway for public access and NAT Gateway for private instances.
2. Security Groups:
    * Public SG: Allows SSH (22) and HTTP (80).
    * Private SG: Restricts MongoDB (27017) access to the public subnet.
3. IAM Roles:
    * Roles are attached to EC2 instances to securely access AWS services.
Configuration and Deployment

* Web Server:
    * Node.js and Nginx are installed using Ansible.
    * The React frontend and Express backend are deployed.
* Database Server:
    * MongoDB is installed and configured with user authentication.
Scalability

* Modify the Terraform configuration to add more EC2 instances for scaling.
* Future enhancements include load balancing with Nginx.
Security Hardening

* Disable root login for SSH.
* Restrict access to EC2 instances using security groups.

