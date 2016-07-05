FROM pypy:2-slim
MAINTAINER Praekelt Foundation <dev@praekeltfoundation.org>

ENV PYPISERVER_VERSION "1.2.0"
RUN pip install --no-cache-dir "pypiserver[passlib,cache]==$PYPISERVER_VERSION"

VOLUME /packages/ /.htpasswd
EXPOSE 8080

CMD if [ -f /.htpasswd ]; then PASSWORDS="--passwords /.htpasswd"; fi; \
  pypi-server $PASSWORDS /packages/
