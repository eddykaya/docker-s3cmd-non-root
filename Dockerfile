FROM alpine:3.18.4

RUN apk update
RUN apk add python3 py-pip py-setuptools git ca-certificates
RUN pip install python-dateutil

RUN git clone https://github.com/s3tools/s3cmd.git /opt/s3cmd
RUN ln -s /opt/s3cmd/s3cmd /usr/bin/s3cmd

WORKDIR /home
RUN mkdir /s3

# add non root user
RUN addgroup --gid 1000 -S s3 && adduser -u 1000 -S -G s3 -h /home/s3 s3

# Folders for s3cmd optionations
RUN mkdir /opt/src
RUN mkdir /opt/dest

ADD ./files/s3cfg /home/s3/.s3cfg
RUN chown -R s3:s3 /home/s3

WORKDIR /home/s3

USER 1000

# CMD ["/opt/main.sh"]
