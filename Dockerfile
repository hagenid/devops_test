
### STAGE 1: Build ###

FROM lifeistech/node_nginx-base


COPY package.json package-lock.json ./


RUN npm ci && mkdir /ng-app && mv ./node_modules ./ng-app/

WORKDIR /ngx-api-utils


COPY . .

COPY nginx/default.conf /etc/nginx/conf.d/

RUN rm -rf /usr/share/nginx/html/*

COPY ./src /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80