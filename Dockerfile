From openjdk:11

EXPOSE 8181

ADD target/spring-petclinic-2.3.2.BUILD-SNAPSHOT.jar app.jar

ENTRYPOINT [ "java" "-jar" "app.jar" ] 
