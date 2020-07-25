FROM php:7.4-cli

# Install Composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

# Install Node.js and Serverless
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get update && \
    apt-get install -y nodejs && \
    npm install -g serverless

# Install AWS cli
RUN apt update && apt -yq install python-pip && pip install awscli --upgrade

# Install additional tools
RUN apt-get install -y git zip unzip dnsutils