FROM public.ecr.aws/debian/debian:11 AS git

ENV GIT_VERSION=2.47.0
RUN apt-get update && \
    apt-get install wget make zip findutils autoconf gcc tar -y && \
    apt-get install gettext libz-dev -y && \
    cd /root && wget --progress=dot:mega https://github.com/git/git/archive/refs/tags/v${GIT_VERSION}.zip && \
    unzip v${GIT_VERSION}.zip && cd git-${GIT_VERSION} && \
    make configure && \
    ./configure --prefix=/git && \
    make all && \
    make install

FROM public.ecr.aws/debian/debian:11
COPY --from=git /git/ /git/

RUN ln -s /git/bin/* /usr/local/bin && \
    chmod 755 -R /usr/local/bin && \
    useradd -ms /bin/bash git

USER git

ENTRYPOINT [ "git", "--version" ]

