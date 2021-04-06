FROM fedora

RUN yum -y update && yum clean all
RUN yum -y install python3 tcpdump net-tools qperf curl wget nmap netcat iputils nfs-utils bind-utils && yum clean all

ADD index.html /tmp/index.html
ADD http-server.sh /tmp/http-server.sh
RUN chmod 777 /tmp/index.html
RUN chmod 777 /tmp/http-server.sh
RUN chmod +x /tmp/http-server.sh

EXPOSE 8080

CMD [ "/tmp/http-server.sh" ]
