pipeline {
    agent {
            docker {
                image 'maven:3.8.4-jdk-11'
                args '-v /root/.m2:/root/.m2'
            }
    }

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
