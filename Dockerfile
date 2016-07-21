FROM python:3

RUN apt-get update; \
    apt-get install -y vim tree; \
    pip install --upgrade pip wheel virtualenv

RUN virtualenv env

COPY entrypoint.sh /entrypoint.sh
COPY .vimrc /root/.vimrc

RUN echo 'alias l="ls -lsah --color"' >> /root/.bashrc ; \
    echo 'activate () {' >> /root/.bashrc ; \
    echo '  . /env/bin/activate' >> /root/.bashrc ; \
    echo '}' >> /root/.bashrc

RUN git config --global user.email "europython@rdc.li" ; \
    git config --global user.name "EuroPython 2016" ; \
    git config --global alias.ci commit ; \
    git config --global alias.st status ; \
    git config --global alias.co checkout ; \
    git config --global alias.br branch ; \
    git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

RUN mkdir /root/my-package
WORKDIR /root/my-package

ENTRYPOINT /entrypoint.sh
