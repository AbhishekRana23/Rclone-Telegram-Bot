FROM ubuntu:18.04

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app
RUN apt-get -qq update
RUN apt-get -qq install -y git python3 python3-pip wget unzip curl screen sudo
RUN curl https://rclone.org/install.sh | bash
COPY requirements.txt .
COPY rclone.conf /root/.config/rclone/
COPY . .
RUN pip3 install --no-cache-dir -r requirements.txt && \
    apt-get -qq purge git
RUN python3 bot.py    
