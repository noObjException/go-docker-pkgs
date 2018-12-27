FROM golang

RUN apt-get install git

RUN go get github.com/gin-gonic/gin \
 && go get github.com/go-sql-driver/mysql \
 && go get github.com/jinzhu/gorm \
 && go get gopkg.in/go-playground/validator.v9 \
 && go get gopkg.in/ini.v1 \
 && go get github.com/kataras/iris

WORKDIR /packages

COPY go.mod ./

RUN go get -u
#RUN go mod download
#RUN go mod vendor
# RUN go build
