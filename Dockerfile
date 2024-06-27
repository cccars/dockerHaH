FROM amazoncorretto:8-alpine-jdk

RUN apk add --no-cache tzdata
ENV TZ=Asia/Bangkok

ENV hathUser hath
ENV hathHome "/home/hath"
ENV hathBin "/home/hath/bin"

RUN adduser -D "$hathUser"
USER "$hathUser"

RUN cd "$hathHome" && \
    mkdir "$hathBin"

WORKDIR "$hathHome"

COPY . . 

USER root
USER "$hathUser"

EXPOSE 44000

CMD [ "/usr/bin/java", "-jar", "HentaiAtHome.jar", "--port=44000", "--temp-dir=/home/hath/bin/hathtemp", "--log-dir=/home/hath/bin/hathlog"]



