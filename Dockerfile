FROM quay.io/keycloak/keycloak:23.0.6

ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

CMD ["start-dev"]