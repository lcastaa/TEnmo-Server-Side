pipeline {
    agent any
    def returnStatus = 0

    stages {
        stage('Build') {
            steps {
                sh 'bash ./mvnw clean package -Dmaven.test.skip=true'
            }
        }



        stage('Check for previous Running Container & Deploy Container') {
            steps {
                // Check if the container is already running
                script {
                    def isRunning = sh(
                        script: 'sudo docker ps --format "{{.Names}}" | grep tenmoapp',
                        returnStatus: true
                    ).returnStatus == 0

                    // Stop and delete the container if it is running
                    if (isRunning) {
                        sh 'sudo docker stop tenmoapp'
                        sh 'sudo docker rm tenmoapp'
                    }
                }

                // Run the updated container
                sh 'sudo docker-compose up --force-recreate -d'
            }
        }

        stage('Execute Container') {
            steps {
                sh 'sudo docker run -d -p 8081:8081 --network host --name tenmoapp  tenmo_myapp'
            }
        }
    }
}
