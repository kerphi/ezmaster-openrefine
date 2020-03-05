FROM felixlohmeier/openrefine:3.2

# need jq to parse JSON
# vim for debug stuff
RUN apk update && apk add jq vim

# by default we give 2G or RAM to openrefine
RUN echo '{ "OPENREFINE_OPTIONS": "-m 2G" }' > /config.json

COPY docker-entrypoint.overload.sh /usr/local/bin/

# ezmasterization of openrefine
# see https://github.com/Inist-CNRS/ezmaster
RUN echo '{ \
  "httpPort": 3333, \
  "configPath": "/config.json", \
  "configType": "json", \
  "dataPath": "/data", \
  "technicalApplication": false \
}' > /etc/ezmaster.json

ENTRYPOINT [ "docker-entrypoint.overload.sh" ]
CMD [ "-i", "0.0.0.0", "-d", "/data" ]
