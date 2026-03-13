ARG ELIXIR_VERSION=1.19.5
ARG OTP_VERSION=28.3.3
ARG DEBIAN_VERSION=bookworm-20250804-slim

ARG BUILDER_IMAGE="hexpm/elixir:${ELIXIR_VERSION}-erlang-${OTP_VERSION}-debian-${DEBIAN_VERSION}"
ARG RUNNER_IMAGE="debian:${DEBIAN_VERSION}"

FROM ${BUILDER_IMAGE} AS builder

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends build-essential git ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN mix local.hex --force && mix local.rebar --force

ENV MIX_ENV=prod

COPY mix.exs mix.lock ./
COPY config config
RUN mix deps.get --only ${MIX_ENV}
RUN mix deps.compile

COPY lib lib
COPY priv priv
COPY assets assets
RUN mix assets.deploy

RUN mix compile
RUN mix release

FROM ${RUNNER_IMAGE} AS runner

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends libstdc++6 openssl libncurses6 locales ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8
ENV MIX_ENV=prod
ENV PHX_SERVER=true

WORKDIR /app

COPY --from=builder --chown=nobody:root /app/_build/prod/rel/treehouse_gen ./

USER nobody

EXPOSE 4000

CMD ["/app/bin/server"]
