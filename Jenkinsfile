#!groovy

pipeline {
  agent none
  stages {
    stage('Maven Install') {
      agent {
        docker {
          image 'maven:3.5.0'
        }
      }
      steps {
        sh 'mvn clean package -Dcheckstyle.skip'
	sh 'cp /var/jenkins_home/workspace/spring-petclinic-docker/target/spring-petclinic-2.3.0.BUILD-SNAPSHOT.jar /var/jenkins_home/workspace/spring-petclinic-docker'
      }
    }
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t dkulikova-gd/spring-petclinic:latest .'
      }
    }
  }
}