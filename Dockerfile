#FROM ubuntu:20.04
#FROM bitnami/mongodb
FROM mongo
#FROM bitnami/mongodb
SHELL ["/bin/bash", "-c"]
RUN apt-get update && apt-get install nginx nodejs npm curl vim -y
#RUN npm install mongodb
#RUN npm install mongodb
#RUN apt install -y mongodb

ARG MONGO_URL_BUILD="mongodb+srv://bibiefrat:a3bAcd01@cluster0.mnem9gq.mongodb.net/?retryWrites=true&w=majority"
ENV NONGO_URL_RUN=$MONGO_URL_BUILD 
#RUN npm install -g yarn
#RUN yarn add mongodb
RUN npm install mongodb 
RUN mkdir -p /nodeApp/
COPY server.js /nodeApp/
COPY db.js /nodeApp/
COPY mongojs.js /nodeApp/
COPY bibi.html /var/www/html/
COPY run_all.sh /nodeApp/
RUN chmod 777 /nodeApp/run_all.sh
RUN npm install -g n
RUN /usr/local/lib/node_modules/n/bin/n latest
#EXPOSE 8081
#EXPOSE 8080
#EXPOSE 27017
#RUN nohup /bin/bash -c node /nodeApp/server.js &
#RUN nohup /bin/bash -c  nginx
RUN echo "The ENV variable value is $MONGO_URL_BUILD"
ENTRYPOINT /nodeApp/run_all.sh $MONGO_URL_RUN
#RUN nginx
#ENTRYPOINT nginx
#RUN setsid /usr/bin/mongod &
#ENTRYPOINT mongod
#CMD ["/bin/bash"]
#CMD sleep 100
