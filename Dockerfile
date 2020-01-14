# https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner

FROM openjdk:8-alpine

LABEL maintainer="Magno Biét <magno.biet@gmail.com>"

ARG SONAR_SCANNER_CLI_VERSION="3.3.0.1492"

RUN apk add --no-cache curl sed unzip nodejs

ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV SONAR_SCANNER_CLI_URL=https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_CLI_VERSION}-linux.zip

WORKDIR /root

RUN curl --insecure -o ./sonarscanner.zip -L $SONAR_SCANNER_CLI_URL && unzip sonarscanner.zip && rm sonarscanner.zip && mv sonar-scanner-${SONAR_SCANNER_CLI_VERSION}-linux sonar-scanner

ENV SONAR_RUNNER_HOME=/root/sonar-scanner
ENV PATH $PATH:$SONAR_RUNNER_HOME/bin

RUN sed -i 's/use_embedded_jre=true/use_embedded_jre=false/g' $SONAR_RUNNER_HOME/bin/sonar-scanner

CMD sonar-scanner -X
