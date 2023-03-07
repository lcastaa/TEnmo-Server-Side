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
                sh 'sudo docker-compose up -d'
            }
        }

        stage('Execute container') {
            steps {
                sh 'sudo docker run -p 8082:8082 --network host --name tenmoapp  tenmo_myapp'
            }
        }
    }
}