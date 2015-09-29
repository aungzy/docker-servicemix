FROM aungzy/java:openjdk-7-jdk

MAINTAINER aungzy

RUN yum install -y wget zip unzip vim

RUN wget http://apache.openmirror.de/servicemix/servicemix-6/6.0.0/apache-servicemix-6.0.0.zip; \
    unzip -d /opt apache-servicemix-6.0.0.zip; \
    rm -f apache-servicemix-6.0.0.zip; \
    ln -s /opt/apache-servicemix-6.0.0 /opt/servicemix; \
    mkdir /deploy; \
    sed -i 's/^\(felix\.fileinstall\.dir\s*=\s*\).*$/\1\/deploy/' /opt/servicemix/etc/org.apache.felix.fileinstall-deploy.cfg

VOLUME ["/deploy"]

EXPOSE 1099 5702 8101 8181 61616 44444 54327

ENTRYPOINT ["/opt/servicemix/bin/servicemix"]
