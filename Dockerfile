FROM jdk:8u261-jdk-alpine

WORKDIR /app
ENV TZ=Asia/Shanghai
# 时区写入系统文件
RUN ln -snf /usr/share/zoneinfo/$TZ  /etc/localtime && echo $TZ > /etc/timezone
VOLUME /tmp
# 加入打包好的jar文件(xxxxx改为自己文件名)
ADD ./target/rancher-0.0.1-SNAPSHOT.jar .

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app/rancher-0.0.1-SNAPSHOT.jar"]
EXPOSE 8080