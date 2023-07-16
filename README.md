This repository contains the deployment scripts to deploy services. Currently there are helm charts for backend services and db services.

Currently the booking service has deployed.

#### To deploy a backend/fronend service.

- `cd helm/services/Booking-service`
- Create `values.yaml` file in the following format with neccessary attributes.

```
image: <image-name>
replicas: <no-of-replicas>
service: <service-name>

env:
  host: <db-host>
  db: <db-name>
  baseurl: <baseurl-of-service>
```

Pass the container environment variables in the `deployment.yaml` as bellow.

```
env:
- name: SPRING_APPLICATION_JSON
  value: '{"spring": {"datasource": {"url": "jdbc:postgresql://{{ .Values.env.host }}:5432/{{ .Values.env.db }}", "username": "pguser", "password": "pgpw"}}, "server": {"servlet": {"context-path": "/{{ .Values.env.baseurl }}"}}}'
```

#### To deploy a db service.

- `helm/db`
- `helm install <service-name>-db-release .  --set service=<service-name> -n mosip-dbs`