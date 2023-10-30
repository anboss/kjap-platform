FROM openjdk:8
EXPOSE 8090
ADD C:/ProgramData/Jenkins/.jenkins/workspace/MyMBP_feature_snyk/target/kjap-starter-application-0.0.1-SNAPSHOT.jar kjap-platform.jar
ENTRYPOINT ["java", "-jar", "/kjap-platform.jar"]
