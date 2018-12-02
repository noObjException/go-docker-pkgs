FROM golang:alpine

RUN apk add git

RUN go get github.com/gin-gonic/gin
RUN go get github.com/go-sql-driver/mysql
RUN go get github.com/jinzhu/gorm
RUN go get gopkg.in/go-playground/validator.v9
