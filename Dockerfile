FROM anapsix/alpine-java 

COPY ./target/spring-petclinic-2.3.2.BUILD-SNAPSHOT.jar app.jar

CMD ["java","-jar","app.jar"]
