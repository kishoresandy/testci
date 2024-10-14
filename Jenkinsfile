pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://your-git-repo-url.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('your-nodejs-app')
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    docker.image('your-nodejs-app').inside {
                        sh 'npm install'
                        sh 'npm test'  // Run your tests here
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    docker.image('your-nodejs-app').run('-d -p 3000:3000')
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed.'
        }
    }
}

