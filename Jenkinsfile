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
       stage('Docker Push') {
           steps {
               withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                   sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                   sh 'docker push sagar271992/petclinic:latest'
                }
            }
        }

    }

}
