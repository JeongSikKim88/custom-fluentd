FROM centos:centos7
# FROM fluent/fluentd

USER root

# RUN yum update -y

COPY install.sh \
     time.sh \   
    /root/

# COPY td-agent.repo /etc/yum.repos.d/td.repo

# RUN "sh" "-c" "echo 52.84.252.87 packages.treasuredata.com  >> /etc/hosts"

RUN cd /root/; chmod 755 install.sh; chmod 755 time.sh; ./install.sh; ./time.sh

# RUN curl -L https://toolbelt.treasuredata.com/sh/install-redhat-td-agent3.sh | sh

RUN yum install -y telnet net-tools

EXPOSE 24224

COPY fluent.conf /etc/td-agent/td-agent.conf

# USER fluent
# ENTRYPOINT ["tini",  "--", "/bin/entrypoint.sh"]
# CMD ["ln", "-sf", "/usr/share/zoneinfo/Asia/Seoul", "/etc/localtime"]
CMD ["td-agent"]

# RUN [ ${CROSS_BUILD_END} ]