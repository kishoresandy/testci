pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                // Checkout code from your GitHub repo
                git branch: 'master', url: 'https://github.com/kishoresandy/testci.git'
            }
        }
    }
}
