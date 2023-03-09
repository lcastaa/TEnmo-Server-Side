pipeline {
    agent any

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
                    def containerId = sh(
                        script: 'sudo docker ps -aqf "name=tenmoapp" --format="{{.ID}}"',
                        returnStdout: true
                    ).trim()

                    // Stop and delete the container if it is running
                    if (!containerId.empty) {
                        sh "sudo docker container stop ${containerId}"
                        sh "sudo docker container rm ${containerId}"
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
