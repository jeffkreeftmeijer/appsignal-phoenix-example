FROM bitwalker/alpine-elixir:1.5.2
RUN mkdir /build
RUN apk --update upgrade && apk add --no-cache build-base curl
WORKDIR /build
COPY . .
RUN MIX_ENV=prod mix deps.get && MIX_ENV=prod mix compile && MIX_ENV=prod mix release --env=prod

FROM alpine:edge
RUN apk --update upgrade && apk add --update --no-cache ncurses-libs libssl1.0 bash
WORKDIR /app
COPY --from=0 /build .
CMD ["PORT=4000 /bin/bash _build/prod/rel/appsignal_phoenix_example/releases/0.0.1/appsignal_phoenix_example.sh foreground"]
