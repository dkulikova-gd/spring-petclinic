#!groovy

pipeline {
  agent none
  stages {
   
    stage('Maven Install') {
try {
      agent {
        docker {
          image 'maven:3.5.0'
        }
      }
      steps {
        sh 'mvn clean package -Dcheckstyle.skip'
	sh 'cp /var/jenkins_home/workspace/spring-petclinic-docker/target/spring-petclinic-2.3.0.BUILD-SNAPSHOT.jar /var/jenkins_home/workspace/spring-petclinic-docker'
      }
} catch(err){
        throw e
    }  
    }
      
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t dkulikova/spring-petclinic:latest .'
      }
    }
    stage('Docker Push') {
      agent any
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'docker push dkulikova/spring-petclinic:latest'      }
      }
    }
  }
}