## Terraform Building Blocks

### 1. The provider block   
specifies the cloud provider or service you are managing.
```
provider "aws" {
  region = "us-east-1"
}

```

## 2. Resource Block  
The resource block is used to create or manage infrastructure components. 
```
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
  }
}
```

### 3. Variable Block
Use the variable block to define input variables for flexibility. 
```
variable "instance_type" {
  default     = "t2.micro"
  description = "Instance type to be used"
  type        = string
}
```

### 4. Output Block
The output block allows you to display results of your Terraform execution. 

```
output "instance_ip" {
  value = aws_instance.example.public_ip
}

```

### 5. Data Block
The data block is used to fetch existing resources from a provider.

```
data "aws_ami" "example" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}
```

### 6. Module Block
The module block lets you organize and reuse code by calling other modules.
```
module "vpc" {
  source = "./modules/vpc"
  cidr   = "10.0.0.0/16"
}
```

### 7. Terraform Block
```
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         = "my-terraform-state"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
  }
}
```

## Install Terraform on Windows:
To install Terraform on Windows, follow these steps:  
1. Download the Terraform executable (.exe) file from the official Terraform - [https://developer.hashicorp.com/terraform/install]  
2. Create a new directory for Terraform, such as "C:\Program Files (x86)\Terraform".  
3. Extract the downloaded .zip file and copy the terraform.exe file to the newly created directory.    
4. Add the Terraform directory path to the system's PATH environment variable:  
5. Open the Start menu and search for "Environment variables".  
6. Click on "Edit the system environment variables".  
7. Click the "Environment Variables" button.  
8. Under "System variables," find and select the "Path" variable, then click "Edit".  
9. Click "New" and add the Terraform directory path (e.g., C:\Program Files (x86)\Terraform).  
10. Click "OK" to save the changes.  
11. Open a new command prompt and verify the installation by typing:  
text
```
terraform -v
```
This should display the current version of Terraform

## Configure Terraform to work with visual studio code
1. To integrate Terraform to run from the Bash terminal in Visual Studio Code, follow these steps:  
2. Install the Azure Terraform extension in VS Code by searching for "Azure Terraform" in the Extensions marketplace and clicking Install  
3. Open your Terraform project folder in VS Code using File > Open Folder.  
4. Access the integrated terminal in VS Code by selecting View > Terminal from the menu or using the keyboard shortcut Ctrl+`.  
5. In the terminal, select Bash as your preferred shell if it's not already the default.  
6. Ensure Terraform is installed on your system and added to your PATH environment variable.  
7. You can now run Terraform commands directly in the Bash terminal within VS Code. For example:  
```
terraform init
terraform plan
terraform apply
```

## Install the AWS Toolkit extension for VS Code:
1. Open VS Code and go to the Extensions view (Ctrl+Shift+X or Cmd+Shift+X)  
2. Search for "AWS Toolkit" in the Extensions marketplace  
3. Click Install and reload VS Code if prompted.  
4. Set up AWS credentials:  
5. Open the Command Palette (Ctrl+Shift+P or Cmd+Shift+P).  
6. Type "AWS" and select "AWS: Create Credentials Profile"  
7. Follow the prompts to enter your AWS Access Key ID and Secret Access Key.  
8. Connect to your AWS account:  
9. Click on the AWS icon in the Activity Bar.  
10. Choose "Connect to AWS" and select your credentials profile.  

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



