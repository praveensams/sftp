FROM centos

COPY sam.key /etc/ssh/ssh_host_rsa_key
COPY sam.key /etc/ssh/ssh_host_dsa_key
COPY sam.key  /etc/ssh/ssh_host_ecdsa_key
COPY sam.key  /etc/ssh/ssh_host_ed25519_key


RUN yum install openssh -y \
    && yum install initscripts-9.49.46-1.el7.x86_64 -y \
    && yum install  openssh-server-7.4p1-16.el7.x86_64  -y \
    && groupadd sftpgroup \
    && adduser sftphybris -g sftpgroup -s /sbin/nologin \
    &&  echo 'Pe@rson@123' | passwd --stdin sftphybris \
    && for i in /etc/ssh/* ; do chmod 400 $i ; done 
     
COPY sshd_config /etc/ssh/sshd_config

CMD ["/usr/sbin/sshd","-D"]
