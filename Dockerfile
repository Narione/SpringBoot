FROM ubuntu:22.04
LABEL authors="yuyu"

#환경 변수 설정(옵션)
ENV LC_ALL C.UTF-8
ENV TZ Asia/Seoul

# 실행시킬 내용을 작성
RUN apt-get update -qq && \
    apt-get upgrade -y && \
    apt-get install -y tzdata && \
    apt-get install -y openjdk-17-jre

# 빌드된 war파일을 도커의 root 폴더 아래로 복사
ADD build/libs/SpringBoot-0.0.1.war /root

# 작업할 디렉토리로 이동
WORKDIR /root

# 우분투의 포트를 개방시켜준다.
EXPOSE 8080

# 컨테이너가 시작될 때 실행되는 명령어
# java -jar SpringBoot-0.0.1.war &
CMD ["java", "-jar", "SpringBoot-0.0.1.war", "&"]


