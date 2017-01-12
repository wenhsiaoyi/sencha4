FROM wenhsiaoyi/ubuntu:xenial
MAINTAINER Jack Wen <http://github.com/wenhsiaoyi>


ENV LANG en_US.UTF-8
RUN locale-gen $LANG
ENV PATH ${PATH}:/opt/Sencha/Cmd/4.0.5.87

RUN \

# Install Sencha-CMD
    wget -O sencha-cmd.zip http://cdn.sencha.com/cmd/4.0.5.87/SenchaCmd-4.0.5.87-linux-x64.run.zip && \
    unzip sencha-cmd.zip && rm sencha-cmd.zip && chmod +x SenchaCmd-4.0.5.87-linux-x64.run && \
    mkdir -p /opt/Sencha/Cmd && mv SenchaCmd-4.0.5.87-linux-x64.run /opt/Sencha/Cmd && \
    /opt/Sencha/Cmd/SenchaCmd-4.0.5.87-linux-x64.run --prefix /opt --mode unattended  && \
    rm /opt/Sencha/Cmd/SenchaCmd-4.0.5.87-linux-x64.run

VOLUME ["/var/www", "/opt/projects"]
WORKDIR /var/www

CMD ["bash"]
