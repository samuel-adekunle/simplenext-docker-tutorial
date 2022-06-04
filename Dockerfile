FROM node:alpine as build

WORKDIR "/home/app"

RUN npm install -g pm2

EXPOSE 3000

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

CMD [ "pm2-runtime", "npm", "--", "start" ]