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
                step{
                sh 'sudo docker-compose up -d'
                }
                step{
                sh 'docker run -p 8081:8081 --name tenmoapp tenmo_myapp'
                }
            }
        }


    }
}