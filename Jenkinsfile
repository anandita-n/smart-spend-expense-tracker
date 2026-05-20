pipeline {
    agent any

    tools {
        nodejs 'NodeJS'
    }

    stages {

        stage('Frontend Dependencies') {
            steps {
                dir('frontend') {
                    bat 'npm install'
                }
            }
        }

        stage('Backend Dependencies') {
            steps {
                dir('backend') {
                    bat 'npm install'
                }
            }
        }

        stage('Dependency Check') {
    steps {
        dir('backend') {
            bat 'npm audit || exit 0'
        }
    }
}
stage('SonarQube Analysis') {
    steps {
        script {
            def scannerHome = tool 'SonarScanner'

            withSonarQubeEnv('SonarQube') {
                bat "${scannerHome}\\bin\\sonar-scanner.bat"
            }
        }
    }
}

        stage('Docker Build') {
            steps {
                bat 'docker-compose build'
            }
        }

    }
}