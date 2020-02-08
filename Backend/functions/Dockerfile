FROM node
WORKDIR /src

RUN apt-get -qq update \
   && apt-get install -qq -y \
   libgtk2.0-0 \
   libnotify-dev \
   libgconf-2-4 \
   libnss3 \
   libxss1 \
   libasound2 \
   xvfb \
   lsof
   