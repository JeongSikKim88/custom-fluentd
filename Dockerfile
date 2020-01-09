FROM centos:centos7
# FROM fluent/fluentd

USER root

# Copy fluentd & utc sync scripts
COPY install.sh \
     time.sh \   
    /root/

RUN cd /root/; chmod 755 install.sh; chmod 755 time.sh; ./install.sh; ./time.sh

# RUN curl -L https://toolbelt.treasuredata.com/sh/install-redhat-td-agent3.sh | sh

RUN yum install -y telnet net-tools

EXPOSE 24224

COPY fluent.conf /etc/td-agent/td-agent.conf

CMD ["td-agent"]