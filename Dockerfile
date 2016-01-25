FROM pypy:2-slim
MAINTAINER Praekelt Foundation <dev@praekeltfoundation.org>

RUN pip install virtualenv && \
  virtualenv /virtualenv
ENV PATH /virtualenv/bin:$PATH

RUN pip install --no-cache-dir pypiserver==1.1.10 passlib watchdog

VOLUME /packages/ /.htpasswd
EXPOSE 8080

CMD if [ -f /.htpasswd ]; then PASSWORDS="--passwords /.htpassed"; fi; \
  pypi-server $PASSWORDS /packages/
