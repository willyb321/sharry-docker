FROM hseeberger/scala-sbt

WORKDIR /app

USER root

RUN git clone https://github.com/eikek/sharry.git /app

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -

RUN apt install nodejs npm --yes

RUN npm i -g elm elm-test

RUN sbt make

COPY entrypoint.sh /entrypoint.sh

CMD /entrypoint.sh
