FROM ubuntu

EXPOSE 5244

RUN apt -y update && apt install -y wget curl tar bash unzip

RUN mkdir /opt/alist && wget -q https://github.com/Xhofe/alist/releases/latest/download/alist-linux-amd64.tar.gz -O /opt/alist/alist.tar.gz \
&& tar -C /opt/alist -Pzxvf /opt/alist/alist.tar.gz && chmod +x /opt/alist/alist && wget -q https://raw.githubusercontent.com/wikjohnsure/alist/main/a.sh -O /opt/alist/a.sh

RUN mkdir /opt/alist/data \
&& wget -q https://github.com/wikjohnsure/alist/raw/main/config.json -O /opt/alist/data/config.json \
&& wget -q https://github.com/wikjohnsure/alist/raw/main/data.db -O /opt/alist/data/data.db \
&& wget -q https://github.com/wikjohnsure/alist/raw/main/data.db-shm -O /opt/alist/data/data.db-shm \
&& wget -q https://github.com/wikjohnsure/alist/raw/main/data.db-wal -O /opt/alist/data/data.db-wal

ENTRYPOINT bash /opt/alist/a.sh
