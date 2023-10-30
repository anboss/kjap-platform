FROM openjdk:8
EXPOSE 8091
WORKDIR C:/ProgramData/Jenkins/.jenkins/workspace/MyMBP_feature_snyk/target/
ADD  ./kjap-starter-application-0.0.1-SNAPSHOT.jar kjap-starter-application-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "/kjap-starter-application-0.0.1-SNAPSHOT.jar"]
