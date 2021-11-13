pipeline{
    agent{
        label "any"
    }
    stages{
        stage("build"){
            steps{
               sh 'mvn clean package'
            }
        }
    }

}