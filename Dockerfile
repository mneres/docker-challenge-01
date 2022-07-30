FROM golang:alpine3.15 as builder
WORKDIR /go

COPY . .

RUN go build -o /app /go/src/app.go

FROM scratch
COPY --from=builder /app .
ENTRYPOINT [ "/app" ]
