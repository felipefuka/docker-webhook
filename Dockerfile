FROM docker:stable

RUN apk add --no-cache python3 openssl-dev libffi-dev make curl git build-base python3-dev py3-pip bash && \
    pip3 install docker-compose && \
    apk del build-base python3-dev libffi-dev openssl-dev

# Create /app/ and /app/hooks/
RUN mkdir -p /app/hooks/

WORKDIR /app

# Install requirements
COPY requirements.txt ./requirements.txt
RUN pip3 install -r requirements.txt && \
    rm -f requirements.txt

RUN wget https://github.com/cli/cli/releases/download/v1.4.0/gh_1.4.0_linux_arm64.tar.gz && \
    tar xvf gh_1.4.0_linux_arm64.tar.gz && \
    cp gh_1.4.0_linux_arm64/bin/gh /usr/local/bin/

COPY gh-docker-token.txt ./gh-docker-token.txt
# POSSIBLE TLS TIMEOUT
RUN gh auth login --with-token < gh-docker-token.txt 

# Copy in webhook listener script
COPY webhook_listener.py ./webhook_listener.py
EXPOSE 8000
CMD ["python3", "webhook_listener.py"]

