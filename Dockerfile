FROM mcr.microsoft.com/dotnet/core/sdk:3.1.101

ENV NODE_VERSION 12.14.1
ENV NODE_DOWNLOAD_SHA e21be7dd07cc143c480695d6214f40873a7791f437c1ca12fc94d45f539a47d9
# SHA https://nodejs.org/dist/v{NODE_VERSION}/SHASUMS256.txt

RUN curl -SL "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz" --output nodejs.tar.gz \
    && echo "$NODE_DOWNLOAD_SHA nodejs.tar.gz" | sha256sum -c - \
    && tar -xzf "nodejs.tar.gz" -C /usr/local --strip-components=1 \
    && rm nodejs.tar.gz \
    && ln -s /usr/local/bin/node /usr/local/bin/nodejs
    
