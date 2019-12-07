FROM mcr.microsoft.com/dotnet/core/sdk:2.2.207

ENV NODE_VERSION 12.13.1
ENV NODE_DOWNLOAD_SHA 2cc1a9b118e5d660cd6611c808f0cd80821c79ea5990c221b78124770f4dc38e

RUN curl -SL "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz" --output nodejs.tar.gz \
    && echo "$NODE_DOWNLOAD_SHA nodejs.tar.gz" | sha256sum -c - \
    && tar -xzf "nodejs.tar.gz" -C /usr/local --strip-components=1 \
    && rm nodejs.tar.gz \
    && ln -s /usr/local/bin/node /usr/local/bin/nodejs
    
