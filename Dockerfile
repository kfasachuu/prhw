FROM node:lts-buster

RUN git clone https://github.com/princerudh/prince-rudh-md /root/PrinceRudhMD

WORKDIR /root/PrinceRudhMD/

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*
  
RUN npm install -g npm@8.10.0

RUN yarn install --no-audit

RUN npm i -g heroku

CMD ["node", "index.js"]
