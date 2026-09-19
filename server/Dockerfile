# server/Dockerfile

ARG ERLANG_VERSION=29.1
ARG GLEAM_VERSION=v1.18.1

FROM ghcr.io/gleam-lang/gleam:${GLEAM_VERSION}-scratch AS gleam   

FROM erlang:${ERLANG_VERSION}-alpine AS build                     
COPY --from=gleam /bin/gleam /bin/gleam
WORKDIR /papirates/server
COPY shared/gleam.toml /papirates/shared/gleam.toml                  
COPY server/gleam.toml server/manifest.toml ./                    
RUN gleam deps download                                           
COPY shared/ /papirates/shared/                                      
COPY server/ ./                                                   
RUN gleam export erlang-shipment

FROM erlang:${ERLANG_VERSION}-alpine                              
COPY --from=build /papirates/server/build/erlang-shipment /papirates-server
WORKDIR /papirates-server
ENTRYPOINT ["/bin/sh", "/papirates-server/entrypoint.sh"]
CMD ["run"]