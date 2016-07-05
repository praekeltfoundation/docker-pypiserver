FROM praekeltfoundation/pypy-base
MAINTAINER Praekelt Foundation <dev@praekeltfoundation.org>

ENV PYPISERVER_VERSION "1.2.0"
RUN pip install --no-cache-dir "pypiserver[passlib,cache]==$PYPISERVER_VERSION"

VOLUME /packages/ /.htpasswd
EXPOSE 8080

COPY pypiserver-entrypoint.sh /scripts/

CMD ["pypiserver-entrypoint.sh"]
