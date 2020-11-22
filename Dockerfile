FROM registry.cn-beijing.aliyuncs.com/zanda/alpine:latest 

MAINTAINER panda

RUN wget -P /opt https://patools.oss-cn-beijing.aliyuncs.com/jdk1.8/jdk-8u271-linux-x64.tar.gz \
    && tar -xf /opt/jdk-8u271-linux-x64.tar.gz -C /usr/local \
    && echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.9/main/" >> /etc/apk/repositories \
    && apk --no-cache add ca-certificates \
    && wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.30-r0/glibc-2.30-r0.apk \
    && apk add glibc-2.30-r0.apk \
    && rm -rf *.apk \
    && rm -rf /var/cache/apk/*

ENV JAVA_HOME=/usr/local/jdk1.8.0_271 \
    JRE_HOME=/usr/local/jdk1.8.0_271/jre \
    CLASSPATH=/usr/local/jdk1.8.0_271/lib/tools.jar:/usr/local/jdk1.8.0_271/lib/dt.jar:/usr/local/jdk1.8.0_271/lib \
    PATH=/usr/local/jdk1.8.0_271/bin:/usr/local/jdk1.8.0_271/jre/bin:$PATH
