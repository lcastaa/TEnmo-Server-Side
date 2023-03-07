pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'bash ./mvnw clean package -Dmaven.test.skip=true'
            }
        }

        stage('Deploy and Execute container') {
            steps {
                sh 'sudo docker-compose up -d
                sudo docker-compose up -d
                CONTAINER_NAME=$(docker-compose ps -q <SERVICE_NAME>)
                IMAGE_NAME=$(docker ps --filter "name=$CONTAINER_NAME" --format "{{.Image}}")
                docker run --name TEnmo -p 8080:8080 $IMAGE_NAME'
            }
        }


    }
}