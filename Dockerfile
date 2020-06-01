FROM anapsix/alpine-java 
WORKDIR /
COPY ./var/jenkins_home/workspace/spring-petclinic-docker/target/spring-petclinic-2.3.0.BUILD-SNAPSHOT.jar ./home/

CMD ["java","-jar","./home/spring-petclinic-2.3.0.BUILD-SNAPSHOT.jar"]