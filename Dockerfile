FROM ruby

WORKDIR /app

RUN apt-get update
RUN apt-get install android-sdk -y

RUN gem install fastlane -NV

ENV ANDROID_HOME=/usr/lib/android-sdk
ENV PATH=$PATH:$ANDROID_HOME/tools/bin
ENV PATH=$PATH:$ANDROID_HOME/platform-tools

RUN wget https://dl.google.com/android/repository/commandlinetools-linux-6609375_latest.zip
RUN unzip commandlinetools-linux-6609375_latest.zip -d cmdline-tools
RUN mv cmdline-tools $ANDROID_HOME/

ENV PATH=$PATH:$ANDROID_HOME/cmdline-tools/tools/bin