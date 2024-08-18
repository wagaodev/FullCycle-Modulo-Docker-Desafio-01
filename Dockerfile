FROM golang:alpine AS builder

WORKDIR /app

COPY . .

RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -ldflags="-s -w" -o main .

FROM scratch

COPY --from=builder /app/main /main

CMD ["/main"]
