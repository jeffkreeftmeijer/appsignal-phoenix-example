FROM lostkobrakai/centos6-elixir
RUN mkdir /build && mkdir /data
RUN yum groupinstall 'Development Tools' -y
WORKDIR /build
COPY . .
RUN MIX_ENV=prod mix deps.get && MIX_ENV=prod mix compile && MIX_ENV=prod mix release --env=prod

FROM centos:centos6
WORKDIR /app
COPY --from=0 /build .
CMD ["PORT=4000 /bin/bash _build/prod/rel/appsignal_phoenix_example/releases/0.0.1/appsignal_phoenix_example.sh foreground"]
