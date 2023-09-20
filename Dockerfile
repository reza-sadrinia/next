FROM node:16 as build

WORKDIR /usr/src/app

COPY package.json .

RUN yarn install 

COPY . .

RUN yarn build 

RUN yarn export

FROM node:alpine as prd

WORKDIR /usr/src/app

COPY --from=build /usr/src/app /usr/src/app 

EXPOSE 3000

ENTRYPOINT ["yarn", "start"]
