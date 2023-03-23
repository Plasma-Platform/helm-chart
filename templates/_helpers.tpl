{{/*
Return full image name.
Caution: fpm.image function is not used in loop-defined pods, such as workerd.yaml, cron.yaml
due to some weird error for such Helm templates.
Please consider this when changing fpm.image here and change it in such templates as well.
*/}}
{{- define "fpm.image" -}}
"{{ $.Values.image.registryfullpath }}/fpm:{{ $.Values.image.tag }}"
{{- end -}}

{{- define "fpm.secrets" }}
{{- range $secret := . }}
- name: {{ $secret.name }}
  valueFrom:
    secretKeyRef:
      name: {{ $secret.secretKeyRefName }}
      key: {{ $secret.secretKeyRefKey }}
{{- end -}}
{{- end -}}


