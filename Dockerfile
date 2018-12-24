FROM golang

RUN apt-get install git

RUN go get github.com/gin-gonic/gin
RUN go get github.com/go-sql-driver/mysql
RUN go get github.com/jinzhu/gorm
RUN go get gopkg.in/go-playground/validator.v9
RUN go get github.com/kataras/iris

WORKDIR /packages

COPY go.mod ./

RUN go get -u
#RUN go mod download
#RUN go mod vendor
# RUN go build
