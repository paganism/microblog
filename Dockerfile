FROM python:3.6-alpine

RUN adduser -D microblog

WORKDIR /home/microblog

RUN apk --update add libxml2-dev libxslt-dev libffi-dev gcc musl-dev libgcc openssl-dev curl
RUN apk add jpeg-dev zlib-dev freetype-dev lcms2-dev openjpeg-dev tiff-dev tk-dev tcl-dev

COPY requirements.txt requirements.txt
COPY image_resize.py image_resize.py
RUN python3 -m venv .venv
RUN .venv/bin/pip install -r requirements.txt
RUN .venv/bin/pip install gunicorn pymysql

COPY app app
COPY migrations migrations
COPY microblog.py config.py boot.sh ./
RUN chmod +x boot.sh

ENV FLASK_APP microblog.py

RUN chown -R microblog:microblog ./
USER microblog

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]
