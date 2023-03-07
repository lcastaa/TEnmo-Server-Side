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
                sh 'sudo docker-compose up -d',
                sh 'CONTAINER_NAME=$(docker-compose ps -q {<SERVICE_NAME>})',
                sh 'IMAGE_NAME=$(docker ps --filter "name=$CONTAINER_NAME" --format "{{.Image}}")',
                sh 'docker run --name TEnmo -p 8081:8081 $IMAGE_NAME'
            }
        }


    }
}