FROM mcr.microsoft.com/dotnet/core/sdk:3.1.401

ENV NODE_VERSION 12.18.3
ENV NODE_DOWNLOAD_SHA 8cdacecc43c35bcfa5474c793b9e7a01835e4171264f7b13f3e57093371872e9
# SHA https://nodejs.org/dist/v{NODE_VERSION}/SHASUMS256.txt

RUN curl -SL "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz" --output nodejs.tar.gz \
    && echo "$NODE_DOWNLOAD_SHA nodejs.tar.gz" | sha256sum -c - \
    && tar -xzf "nodejs.tar.gz" -C /usr/local --strip-components=1 \
    && rm nodejs.tar.gz \
    && ln -s /usr/local/bin/node /usr/local/bin/nodejs
    
