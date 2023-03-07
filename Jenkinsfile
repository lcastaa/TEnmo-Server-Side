pipeline {
    agent any

    stages {
        stage('Clone Repo'){
            steps {
                git branch: 'main',
                credentialsId: 'github-Jenkins',
                url: 'https://github.com/lcastaa/TEnmo-Server-Side.git'
            }
        }

        stage('Build') {
            steps {
                sh 'bash ./mvnw clean package'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker-compose up -d'
            }
        }
    }
}