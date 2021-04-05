FROM fedora

RUN yum -y update && yum clean all
RUN yum -y install python3 tcpdump net-tools qperf curl wget nmap ncat && yum clean all

ADD index.html /tmp/index.html
RUN chmod 777 /tmp/index.html

EXPOSE 8080

CMD [ "python3 -m http.server --directory /tmp" ]
