Fluentd 커스텀하여 빌드하는 Dockerfile 입니다.

### Docker Run ###
docker run -d -v /logdata/access/:/logdata/access/ --net=host regi.myskcdn.net:5000/caclog:1.5