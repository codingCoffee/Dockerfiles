FROM alpine:3.13.5

LABEL maintainer="Ameya Shenoy <shenoy.ameya@gmail.com>"

# Arguement for Password
ARG PASSWORD

# Installing the openssh and bash package, removing the apk cache
RUN set -ex \
  && apk --update add --no-cache \
    bash \
    openssh \
  && sed -i s/#PermitRootLogin.*/PermitRootLogin\ no/ /etc/ssh/sshd_config \
  && sed -i s/#PermitTTY.*/PermitTTY\ no/ /etc/ssh/sshd_config \
  && sed -i s/#AllowAgentForwarding.*/AllowAgentForwarding\ no/ /etc/ssh/sshd_config \
  && sed -i s/#AllowTcpForwarding.*/AllowTcpForwarding\ no/ /etc/ssh/sshd_config \
  && sed -ie 's/#Port 22/Port 22/g' /etc/ssh/sshd_config \
  && sed -i "$ a ForceCommand echo 'Welcome! Your token is 123456'" /etc/ssh/sshd_config \
  && export NOTVISIBLE="in users profile" \
  && echo "export VISIBLE=now" >> /etc/profile \
  && /usr/bin/ssh-keygen -A \
  && ssh-keygen -t rsa -b 4096 -f  /etc/ssh/ssh_host_key \
  && echo "root:${PASSWORD}" | chpasswd \
  && rm -rf /var/cache/apk/*

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]

