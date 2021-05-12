FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# the first block copies the essential files to /app/build which shall later be used by nginx.

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html 
# here from the first block 0 which is the above block the app/build directory is copied to nginx processing directory to make nginx being able to work/serve the files
