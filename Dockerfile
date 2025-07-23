FROM node:20-alpine

WORKDIR /app

COPY ./package.json ./package.json
COPY ./package-lock.json ./package-lock.json

RUN npm install

COPY . .

ENV DATABASE_URL = postgresql://sujay:xxx123@localhost:5432/mydatabase


RUN npx prisma migrate dev

RUN npx prisma generate

RUN npm run build

CMD ["node", "dist/index.js"]