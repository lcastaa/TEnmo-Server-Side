pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'bash ./mvnw clean package -Dmaven.test.skip=true'
            }
        }

        stage('Deploy') {
            steps {
                sh 'sudo docker-compose up -d '
            }
        }
    }
}