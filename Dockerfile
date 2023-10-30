FROM openjdk:8
EXPOSE 8090
ADD env.WORKSPACE/target/kjap-platform.jar kjap-platform.jar
ENTRYPOINT ["java", "-jar", "/kjap-platform.jar"]
