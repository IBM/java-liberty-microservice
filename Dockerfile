FROM ibmjava:8-sdk AS builder
LABEL maintainer="IBM Java Engineering at IBM Cloud"

WORKDIR /app
COPY . /app

RUN apt-get update && apt-get install -y maven
RUN mvn -N io.takari:maven:wrapper -Dmaven=3.5.0
RUN ./mvnw install

FROM websphere-liberty:webProfile7
LABEL maintainer="IBM Java Engineering at IBM Cloud"
ENV PATH /project/target/liberty/wlp/bin/:$PATH

COPY --from=builder /app/target/liberty/wlp/usr/servers/defaultServer /config/
# Grant write access to apps folder, this is to support old and new docker versions.
# Liberty document reference : https://hub.docker.com/_/websphere-liberty/
USER root
RUN chmod g+w /config/apps
USER 1001
# install any missing features required by server config
RUN installUtility install --acceptLicense defaultServer

# Upgrade to production license if URL to JAR provided
#ARG LICENSE_JAR_URL
#RUN \
#  if [ $LICENSE_JAR_URL ]; then \
#    wget $LICENSE_JAR_URL -O /tmp/license.jar \
#    && java -jar /tmp/license.jar -acceptLicense /opt/ibm \
#    && rm /tmp/license.jar; \
#  fi

# This script will add the requested XML snippets, grow image to be fit-for-purpose and apply interim fixes
#RUN configure.sh
