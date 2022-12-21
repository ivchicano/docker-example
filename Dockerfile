FROM maven:3.8.6-eclipse-temurin-17-alpine as build
WORKDIR /workspace/app

COPY pom.xml .
COPY src src

RUN mvn package -DskipTests

FROM eclipse-temurin:17-jre-alpine
COPY --from=build /workspace/app/target/items-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]