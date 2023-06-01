pipeline {
     agent any
    stages {
        stage('Clone project') {
            steps {
                git branch: 'develop', credentialsId: 'GIT_CREDENTIAL' ,url: 'https://github.com/camilo1997/Karate.git'
            }
        }

          stage('Build') {
            steps {
                sh 'chmod +x gradlew'
                sh './gradlew clean build -x test'
            }
        }
        stage('Run tests') {
            steps {
                sh './gradlew test --tests **RunnerAll**'
            }
        }
    }
    post {
        always {
            publishHTML(target: [
                reportName: 'Karate',
                reportDir: 'build/reports/tests/test',
                reportFiles: 'index.html',
                keepAll: true,
                alwaysLinkToLastBuild: true,
                allowMissing: false
            ])
            //sendSlackNotification(currentBuild.result);
        }
    }
}