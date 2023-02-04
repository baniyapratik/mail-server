FROM alpine:latest

RUN mkdir /app
# mailer-service is the build binary
COPY mailer-service /app
CMD ["/app/mailer-service"]