FROM buildpack-deps:focal

RUN python3 -c "$(curl -fsSL https://raw.githubusercontent.com/platformio/platformio/develop/scripts/get-platformio.py)" && \
  curl -fsSL https://raw.githubusercontent.com/platformio/platformio-core-installer/master/get-platformio.py -o get-platformio.py && \
  python3 get-platformio.py && \
  mkdir /work

COPY marlin-config-helper /bin/marlin-config-helper
RUN chmod +x /bin/marlin-config-helper

WORKDIR /work

COPY docker/docker-entrypoint.sh .
RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]
