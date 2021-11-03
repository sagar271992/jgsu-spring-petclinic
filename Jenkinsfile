pipeline {
    agent any
    tool {
        maven "maven-3.8"
    }

    stages {
        stage('Build') {
            steps {
                sh 'mvn -v'
                sh 'mvn clean'
                sh 'mvn compile'

                echo ' comiple successfully.....!'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
                echo ' tested successfully.......!'
            }
        }
        stage('Deploy') {
            steps {
                sh 'mvn clean package'
                echo ' packaged successfully....!'
            }
        }
        post {
            success {
            // One or more steps need to be included within each condition's block.
            }
            failure {
            // One or more steps need to be included within each condition's block.
            }
            unsuccessful {
            // One or more steps need to be included within each condition's block.
            }
        }
    }
}
