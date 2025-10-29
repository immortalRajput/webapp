pipeline {
    agent any
    
    parameters{
    string (name: 'imagetag' )
    }
    stages {
        stage ('Clone the code from GITHUB')
        {
        steps {
          
        
        git branch: 'dev', url : 'https://github.com/immortalRajput/webapp.git'
        
    
        }
        }
        stage ("Scan the Code from Github")
        {
        steps {
        sh    ' trivy fs . '
        }
        }
        stage ("Build image out of code")
        {
            steps{
              sh 'docker build -t krytox/webcont:${imagetag} . '
            }
        }
        stage('Login to Docker Registry') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockercred', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin'
                }
            }
        }
        
        stage ("Push the docker image to dockerhub")
        {
            steps{
             sh   'docker push krytox/webcont:${imagetag}'
            }
        }
    }
}
