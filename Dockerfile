FROM ruby

WORKDIR /build/repos

RUN apt-get update
RUN apt-get install android-sdk -y

RUN gem install fastlane -NV

RUN apt-get install nano

ENV ANDROID_HOME=/usr/lib/android-sdk
ENV PATH=$PATH:$ANDROID_HOME/tools/bin
ENV PATH=$PATH:$ANDROID_HOME/platform-tools

RUN wget https://dl.google.com/android/repository/commandlinetools-linux-6609375_latest.zip
RUN unzip commandlinetools-linux-6609375_latest.zip -d cmdline-tools
RUN mv cmdline-tools $ANDROID_HOME/

ENV PATH=$PATH:$ANDROID_HOME/cmdline-tools/tools/bin

RUN yes | sdkmanager --licenses

RUN apt-get install less
RUN apt-get install curl

COPY Fastfile Fastfile

COPY build.sh ./build.sh

RUN stat /build/repos/build.sh

RUN chmod +x  /build/repos/build.sh
ENTRYPOINT  /build/repos/build.sh