FROM node:20-alpine

WORKDIR /app

COPY ./package.json ./package.json
COPY ./package-lock.json ./package-lock.json

RUN npm install

COPY . .

ENV DATABASE_URL=postgresql://postgres:mysecretpassword@localhost:5432/mydatabase

RUN DATABASE_URL=$DATABASE_URL 
RUN npx prisma migrate dev 

RUN npx prisma generate

RUN npm run build

CMD ["node", "dist/index.js"]