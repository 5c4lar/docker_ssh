FROM ubuntu:20.04

COPY sources.list /etc/apt/sources.list

RUN apt update && apt install -y openssh-server sudo -y

RUN apt install -y git wget python3-pip zsh curl

COPY sshd_config /etc/ssh/sshd_config

COPY authorized_keys /root/.ssh/authorized_keys

RUN chmod 700 /root/.ssh && chmod 600 /root/.ssh/authorized_keys

RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

#RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && chsh -s /bin/zsh

RUN service ssh start

EXPOSE 22

CMD ["sh","-c","/usr/sbin/sshd -D"]


