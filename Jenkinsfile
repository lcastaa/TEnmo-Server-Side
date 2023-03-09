pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'bash ./mvnw clean package -Dmaven.test.skip=true'
            }
        }

        stage('Stop and Remove Container') {
            steps {
                script {
                    // Check if the container is already running
                    def containerName = "tenmoapp"

                    // Stop and delete the container if it is running
                    sh "sudo bash ./kill-and-remove-container.sh ${containerName}"
                }
            }
        }

        stage('Creating Container') {
            steps {
                sh 'sudo docker-compose up --force-recreate -d'
            }
        }

        stage('Start Container') {
            steps {
                sh 'sudo docker run -d -p 8081:8081 --network host --name tenmoapp tenmo_myapp'
            }
        }
    }
}
