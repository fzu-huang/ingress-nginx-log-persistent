FROM alpine:3.6
MAINTAINER fzu-huang

# Install base packages
RUN apk update && apk add ca-certificates && \
    apk add tzdata && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone

ADD ./add_permission_of_log_dir.sh /home/k8s/add_permission_of_log_dir.sh

WORKDIR "/home/k8s"

ENV TZ=Asia/Shanghai

CMD ["/bin/sh", "/home/k8s/add_permission_of_log_dir.sh"]
