FROM websphere-liberty:kernel
LABEL maintainer="IBM Java Engineering at IBM Cloud"
COPY --chown=1001:0 /target/liberty/wlp/usr/servers/defaultServer /config/
# Grant write access to apps folder, this is to support old and new docker versions.
# Liberty document reference : https://hub.docker.com/_/websphere-liberty/
USER root
RUN chmod g+w /config/apps
USER 1001
# install any missing features required by server config
RUN installUtility install --acceptLicense defaultServer

# Upgrade to production license if URL to JAR provided
ARG LICENSE_JAR_URL
RUN \ 
  if [ $LICENSE_JAR_URL ]; then \
    wget $LICENSE_JAR_URL -O /tmp/license.jar \
    && java -jar /tmp/license.jar -acceptLicense /opt/ibm \
    && rm /tmp/license.jar; \
  fi

# This script will add the requested XML snippets, grow image to be fit-for-purpose and apply interim fixes
RUN configure.sh
