# Docker SSH Config
A basic configuration setting up sshd on remote server.
## Usage
On your host:

Generate a ssh-key if you don't have one yet with `ssh-keygen`. And add it to your server with `ssh-copy-id username@host-ip-address`

On the server:

```bash
git clone https://github.com/ucasqsl/docker_ssh.git
cd docker_ssh
cat ~/.ssh/authorized_keys > authorized_keys
docker build -t docker_ssh .
cd /path/to/your/workdir
#substitute 30022 with any port your want
docker run -it -d -w /work -v `pwd`:/work --name ssh_container -p 30022:22 docker_ssh
```

Test with the following on your host:

```
ssh root@host-ip-address -p 30022
```

Stop and remove it with `docker stop ssh_container && docker rm ssh_container`
