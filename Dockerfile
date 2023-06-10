FROM alpine:latest

WORKDIR /app

COPY . .

RUN apk add --no-cache nginx jq tor bash && \
    chmod +x entrypoint.sh && \
    cp nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

ENTRYPOINT [ "./entrypoint.sh" ]
