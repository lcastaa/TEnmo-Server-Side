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
                    def containerId = sh(
                        script: 'sudo docker ps -aqf "name=tenmoapp" --format="{{.ID}}"',
                        returnStdout: true
                    ).trim()

                    // Stop and delete the container if it is running
                    if (!containerId.empty) {
                         sh './kill-and-remove-container.sh ${containerId}'
                    }
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
