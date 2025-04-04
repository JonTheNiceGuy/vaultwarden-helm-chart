{{- define "sync.name" -}}
{{- printf "%s-%s" .Chart.Name "sync" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "sync.fullname" -}}
{{- $name := .Chart.Name }}
{{- if contains $name .Release.Name }}
{{- printf "%s-%s" .Release.Name "sync" | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s-%s" .Release.Name "sync" $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{- define "sync.labels" -}}
helm.sh/chart: {{ include "vaultwarden.chart" . }}
{{ include "sync.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "sync.selectorLabels" -}}
app.kubernetes.io/name: {{ include "sync.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
