FROM openjdk:8
EXPOSE 8091
ADD env.WORKSPACE/target/kjap-platform.jar kjap-platform.jar
ENTRYPOINT ["java", "-jar", "/kjap-platform.jar"]
