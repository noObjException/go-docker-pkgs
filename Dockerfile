# FROM golang

# RUN apt-get install git

# RUN go get github.com/gin-gonic/gin \
#  && go get github.com/go-sql-driver/mysql \
#  && go get github.com/jinzhu/gorm \
#  && go get gopkg.in/go-playground/validator.v9 \
#  && go get gopkg.in/ini.v1 \
#  && go get github.com/kataras/iris

# WORKDIR /packages

# COPY go.mod ./

# RUN go get -u
# #RUN go mod download
# #RUN go mod vendor
# # RUN go build

# STEP 1 build executable binary
############################
FROM golang:alpine AS builder
# Install git.
# Git is required for fetching the dependencies.
RUN apk update && apk add --no-cache git
COPY . $GOPATH/src/group-push-api
WORKDIR $GOPATH/src/group-push-api
# Fetch dependencies.
# Using go get.
# RUN go get -d -v

RUN go get golang.org/x/crypto/bcrypt \
  && go get github.com/go-ini/ini \
  && go get gopkg.in/go-playground/validator.v9 \
  && go get github.com/gin-gonic/gin

# Build the binary.
RUN go build -o /go/bin/hello

############################
# STEP 2 build a small image
############################
FROM scratch
# Copy our static executable.
COPY --from=builder /go/bin/hello /go/bin/hello
# Run the hello binary.
ENTRYPOINT ["/go/bin/hello"]
