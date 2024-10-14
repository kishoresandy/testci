pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                // Checkout code from your GitHub repo
                git branch: 'main', url: 'https://github.com/kishoresandy/testci.git'
            }
        }
    }
}
