# server/Dockerfile

ARG ERLANG_VERSION=29.1
ARG GLEAM_VERSION=v1.18.1

FROM ghcr.io/gleam-lang/gleam:${GLEAM_VERSION}-scratch AS gleam   

FROM erlang:${ERLANG_VERSION}-alpine AS build                     
COPY --from=gleam /bin/gleam /bin/gleam
WORKDIR /doable/server
COPY shared/gleam.toml /doable/shared/gleam.toml                  
COPY server/gleam.toml server/manifest.toml ./                    
RUN gleam deps download                                           
COPY shared/ /doable/shared/                                      
COPY server/ ./                                                   
RUN gleam export erlang-shipment

FROM erlang:${ERLANG_VERSION}-alpine                              
COPY --from=build /doable/server/build/erlang-shipment /doable-server
WORKDIR /doable-server
ENTRYPOINT ["/bin/sh", "/doable-server/entrypoint.sh"]
CMD ["run"]