FROM quay.io/keycloak/keycloak:23.0.6 as builder

# Enable health and metrics support
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Database
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://db:5432/keycloak?useSSL=false
ENV KC_DB_USERNAME=postgres
ENV KC_DB_PASSWORD=admin

# Load Balancer / Reverse Proxy
ENV KC_PROXY=edge

# Cache
ENV KC_CACHE=ispn
ENV KC_CACHE_STACK=udp

# Hostname
ENV KC_HOSTNAME_STRICT=false

WORKDIR /opt/keycloak
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:23.0.6
COPY --from=builder /opt/keycloak/ /opt/keycloak/

# Admin
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin


ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]

CMD [ "start-dev"]