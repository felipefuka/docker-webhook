FROM docker:latest
ARG RELAY_KEY
ARG RELAY_SECRET
ARG RELAY_BUCKET

# Install relay
RUN wget -O /usr/local/bin/relay https://storage.googleapis.com/webhookrelay/downloads/relay-linux-arm && \
    chmod +wx /usr/local/bin/relay && \
    relay login -k $RELAY_KEY -s $RELAY_SECRET

EXPOSE 8001
CMD ["relay", "forward", "-b", "relayBucket", "http://localhost:8000/"]