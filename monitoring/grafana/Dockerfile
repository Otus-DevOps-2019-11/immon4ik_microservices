FROM grafana/grafana:6.7.3
COPY datasources.yml /etc/grafana/provisioning/datasources/
COPY providers.yml /etc/grafana/provisioning/dashboards/
COPY ./dashboards/* /etc/grafana/provisioning/dashboards_files/
