FROM ubuntu:trusty

RUN apt update

RUN apt install  openssh-server sudo -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test 

RUN usermod -aG sudo test

RUN service ssh start

RUN  echo 'test:test' | chpasswd

RUN mkdir ~/.ssh && ln -s /run/secrets/host_ssh_key ~/.ssh/id_rsa

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]