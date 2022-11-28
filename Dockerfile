FROM mcr.microsoft.com/dotnet/sdk:7.0.100

ENV NODE_VERSION 18.12.1
ENV NODE_DOWNLOAD_SHA a8fcacb8033504e6d704bdee821f7005ee3774db25c799bcf2a13b5bda7de172
# SHA https://nodejs.org/dist/v{NODE_VERSION}/SHASUMS256.txt

RUN curl -SL "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz" --output nodejs.tar.gz \
    && echo "$NODE_DOWNLOAD_SHA nodejs.tar.gz" | sha256sum -c - \
    && tar -xzf "nodejs.tar.gz" -C /usr/local --strip-components=1 \
    && rm nodejs.tar.gz \
    && ln -s /usr/local/bin/node /usr/local/bin/nodejs
    
