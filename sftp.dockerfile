FROM centos

COPY sam.key /etc/ssh/ssh_host_rsa_key
COPY sam.key /etc/ssh/ssh_host_ecdsa_key
COPY sam.key /etc/ssh/ssh_host_ed25519_key

RUN yum install openssh -y \
   && yum install initscripts-9.49.46-1.el7.x86_64 -y \
   && yum install  openssh-server-7.4p1-16.el7.x86_64  -y \
   && useradd sftphybris && echo 'Pe@rson@123' | passwd --stdin sftphybris \
   && chmod 400 /etc/ssh/ssh_host_rsa_key && chmod 400 /etc/ssh/ssh_host_ecdsa_key && chmod 400 /etc/ssh/ssh_host_ed25519_key 

CMD ["/usr/sbin/sshd","-D"]
