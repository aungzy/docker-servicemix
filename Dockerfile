FROM aungzy/java:openjdk-7-jdk

MAINTAINER aungzy

# Install necessary utilities
RUN yum install -y wget unzip

RUN wget http://apache.openmirror.de/servicemix/servicemix-6/6.0.0/apache-servicemix-6.0.0.zip; \
    unzip -d /opt apache-servicemix-6.0.0.zip; \
    rm -f apache-servicemix-6.0.0.zip; \
    ln -s /opt/apache-servicemix-6.0.0 /opt/servicemix;

EXPOSE 1099 5702 8101 8181 61616 44444 54327

ENTRYPOINT ["/opt/servicemix/bin/servicemix"]

VOLUME [ "/opt/servicemix/etc", "/opt/servicemix/deploy", "/opt/servicemix/data", "/opt/servicemix/data/log" ]

# Uninstall previously installed utilities
RUN yum remove -y wget unzip