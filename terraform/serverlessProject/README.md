## Project For serverless application
1. Download code from this repo
2. lambda_function have python code
3. Execute below commands to create Infra

### Create Infra

```
terraform init
terraform plan
terraform apply
```

### Destroy Infra
```
terraform destory
```

### Test CRUD Application
To test your serverless application and perform CRUD operations, you can use the following methods:  

Create (POST):  
```
curl -X POST https://z7zcqjrs1c.execute-api.us-east-1.amazonaws.com/prod/users -H "Content-Type: application/json" -d '{"name": "John Doe", "email": "john@example.com"}'
```

Read (GET):  
```
curl https://your-api-id.execute-api.region.amazonaws.com/prod/users
curl https://z7zcqjrs1c.execute-api.us-east-1.amazonaws.com/prod/users
```

Update (PUT):  
```
curl -X PUT https://your-api-id.execute-api.region.amazonaws.com/prod/users/user-id -H "Content-Type: application/json" -d '{"name": "Jane Doe"}'
curl -X PUT https://z7zcqjrs1c.execute-api.us-east-1.amazonaws.com/prod/users/b634d055-c293-4824-9705-b50b329ebcaa -H "Content-Type: application/json" -d '{"name": "Jane Doe"}'

```

Delete (DELETE):  
```
curl -X DELETE https://your-api-id.execute-api.region.amazonaws.com/prod/users/user-id
curl -X DELETE https://z7zcqjrs1c.execute-api.us-east-1.amazonaws.com/prod/users/b634d055-c293-4824-9705-b50b329ebcaa

```

### Output
```
$ MINGW64 ~/OneDrive/Documents/Teachings/DevOps/src/projects/terraform/serverlessProject (main)
$ curl -X POST https://z7zcqjrs1c.execute-api.us-east-1.amazonaws.com/prod/users -H "Content-Type: application/json" -d '{"name": "John Doe", "email": "john@example.com"}'
{"id": "0ada7aef-2f19-4cdd-9811-1127e7e118d3"}
$ MINGW64 ~/OneDrive/Documents/Teachings/DevOps/src/projects/terraform/serverlessProject (main)
$ curl https://z7zcqjrs1c.execute-api.us-east-1.amazonaws.com/prod/users
[{"email": "john@example.com", "id": "8170cf3a-17ea-4f9e-add8-d605b0f15856", "name": "John Doe"}, {"email": "john@example.com", "id": "aeb16cc2-b43f-4c6c-a600-eeac18928473", "name": "John Doe"}, {"email": "john@example.com", "id": "b634d055-c293-4824-9705-b50b329ebcaa", "name": "John Doe"}, {"email": "john@example.com", "id": "0ada7aef-2f19-4cdd-9811-1127e7e118d3", "name": "John Doe"}, {"email": "john@example.com", "id": "f329799d-a033-49b2-9fd4-b95e66b7dc28", "name": "John Doe"}]
$ MINGW64 ~/OneDrive/Documents/Teachings/DevOps/src/projects/terraform/serverlessProject (main)

```
