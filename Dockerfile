ARG BUILD_IMAGE=gradle:8.1.1-jdk17-alpine
ARG RUNTIME_IMAGE=openjdk:17-alpine
ARG APP_HOME=/
ARG PROFILE=dev
ARG ARTIFACT_NAME=*.jar
ARG PORT_APP=8010

FROM ${BUILD_IMAGE} as dependencies
ARG APP_HOME
WORKDIR ${APP_HOME}

COPY /src  ./src/
COPY build.gradle settings.gradle ./

RUN gradle build

FROM ${RUNTIME_IMAGE}
ARG APP_HOME
ARG PROFILE
ARG ARTIFACT_NAME
ARG PORT_APP

EXPOSE ${PORT_APP}

COPY --from=dependencies ${APP_HOME}/build/libs/${ARTIFACT_NAME} /app/test.jar
CMD java -Dspring.profiles.active=${PROFILE} -jar /app/test.jar