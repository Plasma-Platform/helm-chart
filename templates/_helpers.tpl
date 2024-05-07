{{/*
Return full image name.
Caution: fpm.image function is not used in loop-defined pods, such as workerd.yaml, cron.yaml
due to some weird error for such Helm templates.
Please consider this when changing fpm.image here and change it in such templates as well.
*/}}
{{- define "fpm.image" -}}
"{{ $.Values.image.registryfullpath }}/fpm:{{ $.Values.image.tag }}"
{{- end -}}

{{- define "worker.hostaliases" }}
{{- $ := index . 0 }}
hostAliases:
- hostnames:
  - backoffice.templatemonster.com
  ip: 10.132.122.32
{{- range $alias := $.Values.hostaliases }}
  - {{ $alias.name }}
  ip: {{ $alias.ip }}
{{- end -}}
{{- end -}}

{{- define "fpm.secrets" }}
{{- $ := index . 0 }}
{{- range $secret := $.Values.secrets }}
- name: {{ $secret.name }}
  valueFrom:
    secretKeyRef:
      name: {{ $.Values.onepassitem }}
      key: {{ $secret.name }}
{{- end -}}
{{- end -}}

{{- define "fpm.volumes" }}
{{- $ := index . 0 }}
- name: env
  configMap:
    name: {{ $.Values.service.app }}
{{- range $volume := $.Values.volumeMounts }}
- name: {{ $volume.name }}
  secret:
    secretName: {{ $.Values.onepassitem }}
    defaultMode: 432
{{- end -}}
{{- end -}}

{{- define "fpm.volumeMounts" }}
{{- $ := index . 0 }}
- name: env
  mountPath: /app/.env
  subPath: env
{{- range $volume := $.Values.volumeMounts }}
- name: {{ $volume.name }}
  readOnly: true
  mountPath: {{ $volume.mountPath }}
  subPath: {{ $volume.subPath }} 
{{- end -}}
{{- end -}}

#{{- define "worker.volumeMounts" }}
#{{- $ := index . 0 }}
#- name: env
#  mountPath: /app/.env
#  subPath: env
#{{- range $volume := $.worker.volumeMounts }}
#- name: {{ $volume.name }}
#  readOnly: true
#  mountPath: {{ $volume.mountPath }}
#  subPath: {{ $volume.subPath }} 
#{{- end -}}
#{{- end -}}



