FROM mcr.microsoft.com/dotnet/sdk:5.0.303

ENV NODE_VERSION 14.17.4
ENV NODE_DOWNLOAD_SHA 99cc7115a30fe62abf06145d57b314092c9bf27499da85413a12f50140199619
# SHA https://nodejs.org/dist/v{NODE_VERSION}/SHASUMS256.txt

RUN curl -SL "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz" --output nodejs.tar.gz \
    && echo "$NODE_DOWNLOAD_SHA nodejs.tar.gz" | sha256sum -c - \
    && tar -xzf "nodejs.tar.gz" -C /usr/local --strip-components=1 \
    && rm nodejs.tar.gz \
    && ln -s /usr/local/bin/node /usr/local/bin/nodejs
    
