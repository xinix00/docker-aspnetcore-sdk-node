FROM cr.microsoft.com/dotnet/sdk:5.0.103

ENV NODE_VERSION 14.16.0
ENV NODE_DOWNLOAD_SHA 7212031d7468718d7c8f5e1766380daaabe09d54611675338e7a88a97c3e31b6
# SHA https://nodejs.org/dist/v{NODE_VERSION}/SHASUMS256.txt

RUN curl -SL "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz" --output nodejs.tar.gz \
    && echo "$NODE_DOWNLOAD_SHA nodejs.tar.gz" | sha256sum -c - \
    && tar -xzf "nodejs.tar.gz" -C /usr/local --strip-components=1 \
    && rm nodejs.tar.gz \
    && ln -s /usr/local/bin/node /usr/local/bin/nodejs
    
