## Install Terraform on Windows:
To install Terraform on Windows, follow these steps:  
Download the Terraform executable (.exe) file from the official Terraform - [https://developer.hashicorp.com/terraform/install]  
Create a new directory for Terraform, such as "C:\Program Files (x86)\Terraform"1.  
Extract the downloaded .zip file and copy the terraform.exe file to the newly created directory13.    
Add the Terraform directory path to the system's PATH environment variable:  
Open the Start menu and search for "Environment variables"3.  
Click on "Edit the system environment variables"3.  
Click the "Environment Variables" button3.  
Under "System variables," find and select the "Path" variable, then click "Edit"3.  
Click "New" and add the Terraform directory path (e.g., C:\Program Files (x86)\Terraform)3.
Click "OK" to save the changes3.
Open a new command prompt and verify the installation by typing:
text
```
terraform -v
```
This should display the current version of Terraform

## Configure Terraform to work with visual studio code
To integrate Terraform to run from the Bash terminal in Visual Studio Code, follow these steps:
Install the Azure Terraform extension in VS Code by searching for "Azure Terraform" in the Extensions marketplace and clicking Install1.
Open your Terraform project folder in VS Code using File > Open Folder.
Access the integrated terminal in VS Code by selecting View > Terminal from the menu or using the keyboard shortcut Ctrl+`1.
In the terminal, select Bash as your preferred shell if it's not already the default.
Ensure Terraform is installed on your system and added to your PATH environment variable.
You can now run Terraform commands directly in the Bash terminal within VS Code. For example:
```
terraform init
terraform plan
terraform apply
```

## Install the AWS Toolkit extension for VS Code:
Open VS Code and go to the Extensions view (Ctrl+Shift+X or Cmd+Shift+X)14.
Search for "AWS Toolkit" in the Extensions marketplace14.
Click Install and reload VS Code if prompted14.
Set up AWS credentials:
Open the Command Palette (Ctrl+Shift+P or Cmd+Shift+P)4.
Type "AWS" and select "AWS: Create Credentials Profile"4.
Follow the prompts to enter your AWS Access Key ID and Secret Access Key4.
Connect to your AWS account:
Click on the AWS icon in the Activity Bar4.
Choose "Connect to AWS" and select your credentials profile4.
Install additional tools (optional but recommended):
Install AWS CLI for command-line operations2.
Install AWS SAM CLI for serverless application development2.
Explore AWS resources:
Use the AWS Explorer in VS Code to view and manage your AWS resources by region

## Install AWS CLI 
(Install AWS CLI using steps)[https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html]

Reload VSCODE and run below command to check

```
aws
```

Once command is running, configure it using 

```
aws configure
```
Enter your access and secret key



