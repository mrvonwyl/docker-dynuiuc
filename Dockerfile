FROM ubuntu:18.04

LABEL maintainer="mrvonwyl@gmail.com"

RUN apt-get update && apt-get install wget -y

# Download the client, install it, and remove the downloaded file
RUN wget https://www.dynu.com/support/downloadfile/31 -qO setup && \
    dpkg -i setup && \
    rm setup

# Start Dynuiuc with the specified files
CMD /usr/bin/dynuiuc --conf_file /etc/dynuiuc/dynuiuc.conf --log_file /var/log/dynuiuc.log --pid_file /var/run/dynuiuc.pid