From openjdk:11

EXPOSE 8181

ADD target/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar

ENTRYPOINT [ "java" "-jar" "spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar" ] 