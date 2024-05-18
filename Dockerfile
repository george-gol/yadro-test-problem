FROM golang:1.22

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY . ./

RUN CGO_ENABLED=0 GOOS=linux go build cmd/main.go

RUN mv ./main /main

CMD ["bash"]
