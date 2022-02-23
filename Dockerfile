FROM mcr.microsoft.com/dotnet/sdk:6.0.200

ENV NODE_VERSION 16.14.0
ENV NODE_DOWNLOAD_SHA 2c69e7b040c208b61ebf9735c63d2e5bcabfed32ef05a9b8dd5823489ea50d6b
# SHA https://nodejs.org/dist/v{NODE_VERSION}/SHASUMS256.txt

RUN curl -SL "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz" --output nodejs.tar.gz \
    && echo "$NODE_DOWNLOAD_SHA nodejs.tar.gz" | sha256sum -c - \
    && tar -xzf "nodejs.tar.gz" -C /usr/local --strip-components=1 \
    && rm nodejs.tar.gz \
    && ln -s /usr/local/bin/node /usr/local/bin/nodejs
    
