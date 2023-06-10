FROM alpine:latest

WORKDIR /app

COPY . .

RUN apk add --no-cache nginx jq tor bash && \
    chmod +x xray entrypoint.sh && \
    cp nginx.conf /etc/nginx/nginx.conf

EXPOSE 3000

ENTRYPOINT [ "./entrypoint.sh" ]