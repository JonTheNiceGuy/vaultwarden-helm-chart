{{- define "checkAndPrintEnvVar" -}}
{{- $env := .Values.environment -}}
{{- $key := .varName -}}
{{- if and (hasKey $env $key) (ne (default "" (toString (index $env $key))) "") }}
    {{ $key }}={{ toString (index $env $key) }}
{{- end }}
{{- end }}

{{- define "checkAndPrintEnvVarQuoted" -}}
{{- $env := .Values.environment -}}
{{- $key := .varName -}}
{{- if and (hasKey $env $key) (ne (default "" (toString (index $env $key))) "") }}
    {{ $key }}="{{ toString (index $env $key) }}"
{{- end }}
{{- end }}

{{- define "checkAndPrintEnvVarSingleQuoted" -}}
{{- $env := .Values.environment -}}
{{- $key := .varName -}}
{{- if and (hasKey $env $key) (ne (default "" (toString (index $env $key))) "") }}
    {{ $key }}='{{ toString (index $env $key) }}'
{{- end }}
{{- end }}

{{- define "checkAndPrintQuotedYamlVar" -}}
{{- $context := .Context -}}
{{- $key := .Key -}}
{{- $keystring := (default $key .Keystring) -}}
{{- $default := (default "null" .Default) -}}
{{- if and (hasKey $context $key) (ne (default "" (toString (index $context $key))) "") -}}
"{{ $keystring }}": "{{ toString (index $context $key) }}"
{{- else -}}
{{- if eq $default "null" -}}
"{{ $keystring }}": null
{{- else -}}
"{{ $keystring }}": "{{ $default }}"
{{- end -}}
{{- end -}}
{{- end }}

{{- define "checkAndPrintYamlVar" -}}
{{- $context := .Context -}}
{{- $key := .Key -}}
{{- $keystring := (default $key .Keystring) -}}
{{- $default := (default "null" .Default) -}}
{{- if and (hasKey $context $key) (ne (default "" (toString (index $context $key))) "") -}}
"{{ $keystring }}": {{ toString (index $context $key) }}
{{- else -}}
{{- if eq $default "null" -}}
"{{ $keystring }}": null
{{- else -}}
"{{ $keystring }}": {{ $default }}
{{- end -}}
{{- end -}}
{{- end }}