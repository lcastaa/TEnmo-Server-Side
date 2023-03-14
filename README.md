# TEnmo-Server-Side
RESTful API server to use with TEnmo-Client-Side application

Server spins up on localhost port 8081
I use a Jenkins file to:
- Create CI/CD pipeline 
- Roll out features to production
- Stop and remove previous docker Images 
- Deploy newly compiled application.

Docker compose is used to:
- package container
- run the Database
- run the Container 

