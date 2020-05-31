FROM jenkins/jenkins:lts

USER root

ENV GO_VERSION=1.10.4 \
    CHECKSUM=fa04efdb17a275a0c6e137f969a1c4eb878939e91e1da16060ce42f02c2ec5ec \
    GOPATH=/go \
    PATH="$PATH:/home/keadist/sbin:/go/bin:/usr/local/go/bin"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        ca-certificates \
        make && \
    curl -sSL https://storage.googleapis.com/golang/go$GO_VERSION.linux-amd64.tar.gz -o /tmp/go.tar.gz && \
    tar -C /usr/local -vxzf /tmp/go.tar.gz && \
    rm /tmp/go.tar.gz && \
    rm -rf /var/lib/apt/lists/* && \
    apt purge curl -y && apt clean -y


