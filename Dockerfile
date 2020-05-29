FROM elixir:1.10.3-alpine

RUN apk add --update alpine-sdk coreutils

ADD . .

ENV MIX_ENV=prod
ENV DATABASE_URL=ecto://USER:PASS@HOST/DATABASE
ENV SECRET_KEY_BASE=THAN7vykG3P/LuHtTT6RIOc0jWl2cKxC

RUN mix local.hex --force
RUN mix local.rebar --force

RUN mix do deps.get --only $MIX_ENV, deps.compile
CMD bash
