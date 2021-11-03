pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                 sh './mvn --version'
                 sh './mvn clean'
                 sh './mvn compile'

                 echo " comiple successfully.....!"
            }
        }
        stage('Test') {
            steps {
               sh './mvn test'
               echo " tested successfully.......!"
            }
        }
        stage('Deploy') {
            steps {
                sh './mvn clean package'
                echo " packaged successfully....!"
            }
        }
    }
}