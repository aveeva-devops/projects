## Don't commit terraform state files in git  
Execute below commands from your local git folder  
```
echo "**/.terraform/*" >> .gitignore
git add .gitignore
git commit -m "Add .terraform to .gitignore"
git push origin main
```

## Create s3 bucket
Run below commands to create s3 bucket  
```
terraform init
terraform plan
terraform apply
```
