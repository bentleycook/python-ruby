FROM ubuntu:14.04

RUN apt-get update && apt-get install -y \
    software-properties-common \
    openssl

RUN add-apt-repository universe

# install Python, pip, and awscli
RUN apt-get install -y python3.4
RUN apt-get install -y python3-pip

# install RVM, Ruby, and Bundler
RUN apt-get install -y curl
RUN apt-get install gnupg2 -y

RUN curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -

RUN curl -L https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.4.1"
RUN /bin/bash -l -c "rvm use 2.4.1"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"
