FROM hseeberger/scala-sbt

WORKDIR /app

USER root

RUN git clone https://github.com/eikek/sharry.git /app

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -

RUN apt install nodejs npm --yes

RUN npm i -g npx

RUN npm i -g elm@0.18.0-exp5 elm-test

RUN sbt make

COPY entrypoint.sh /entrypoint.sh

CMD bash /entrypoint.sh
