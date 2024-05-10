FROM ubuntu:22.04

COPY sources.list /etc/apt/sources.list

RUN apt update && apt install -y openssh-server sudo -y

RUN apt install -y git wget python3-pip fish curl tmux

COPY authorized_keys /root/.ssh/authorized_keys

RUN chmod 700 /root/.ssh && chmod 600 /root/.ssh/authorized_keys

RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

RUN chsh -s /usr/bin/fish

RUN service ssh start

EXPOSE 22

CMD ["sh","-c","/usr/sbin/sshd -D"]


