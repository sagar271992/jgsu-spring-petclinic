pipeline{
    agent any
    
    stages{
        stage("build"){
            steps{
               sh 'mvn clean package'
            }
        }
        stage ("docker build") {
            steps{
                sh "docker build -t sagar271992/petclinic:latest ."
            }
        }
    }

}