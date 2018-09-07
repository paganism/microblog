# microblog

# To Run Docker Container
```
$ docker run --name mysql -d -e MYSQL_RANDOM_ROOT_PASSWORD=yes \
    -e MYSQL_DATABASE=microblog -e MYSQL_USER=microblog \
    -e MYSQL_PASSWORD=microblog \
    mysql/mysql-server:5.7
```

```
$ docker run --name microblog -d -p 8000:5000 --rm -e SECRET_KEY=my-secret-key \
    -e MAIL_SERVER=smtp.googlemail.com -e MAIL_PORT=587 -e MAIL_USE_TLS=true \
    -e MAIL_USERNAME=mygmaillogin -e MAIL_PASSWORD=mygmailpasswd \
    --link mysql:dbserver \
    -e DATABASE_URL=mysql+pymysql://microblog:microblog@dbserver/microblog \
    microblog:latest
```
