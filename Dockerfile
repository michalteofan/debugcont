FROM fedora

RUN yum -y update && yum clean all
RUN yum -y install python3 tcpdump net-tools qperf curl wget nmap netcat && yum clean all

ADD index.html /tmp/index.html
RUN chmod 777 /tmp/index.html

EXPOSE 8080

CMD [ "/usr/bin/python3 -m http.server --directory /tmp 8080" ]
