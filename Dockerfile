FROM openjdk:8
EXPOSE 8090
COPY C:/ProgramData/Jenkins/.jenkins/workspace/MyMBP_feature_snyk/target/kjap-starter-application-0.0.1-SNAPSHOT.jar ./target
ADD  /target/kjap-starter-application-0.0.1-SNAPSHOT.jar kjap-starter-application-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "/kjap-starter-application-0.0.1-SNAPSHOT.jar"]
