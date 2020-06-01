FROM anapsix/alpine-java 
COPY spring-petclinic-2.3.0.BUILD-SNAPSHOT.jar /home/

CMD ["java","-jar","/home/spring-petclinic-2.3.0.BUILD-SNAPSHOT.jar"]