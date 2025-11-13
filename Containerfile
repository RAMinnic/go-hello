# Stage 1: BUilding Application
FROM golang:1.22 AS builder
WORKDIR /app
COPY . .
RUN go build -o myapp main.go

# Stage 2: Serve the applicaiton
FROM alpine:latest
COPY --from=builder /app/dist /usr/local/bin/myapp
CMD ["myapp"]