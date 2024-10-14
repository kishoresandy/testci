pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = 'kishoresandy/kishore'  // Docker Hub repository
        DOCKER_CREDENTIALS_ID = 'DK'              // Jenkins credentials ID for Docker Hub
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Checkout code from your GitHub repository
                git branch: 'master', url: 'https://github.com/kishoresandy/testci.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image from the Dockerfile
                    def image = docker.build("${DOCKER_HUB_REPO}:${env.BUILD_ID}")
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    // Login to Docker Hub using credentials from Jenkins
                    withCredentials([string(credentialsId: "${DOCKER_CREDENTIALS_ID}", variable: 'DOCKER_HUB_PASSWORD')]) {
                        sh 'echo $DOCKER_HUB_PASSWORD | docker login -u kishoresandy --password-stdin'
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Push the image to Docker Hub
                    sh "docker push ${DOCKER_HUB_REPO}:${env.BUILD_ID}"
                }
            }
        }
    }

    post {
        always {
            // Clean up Docker images on the local machine
            sh 'docker system prune -f'
            echo 'Docker image build and push complete.'
        }
    }
}
