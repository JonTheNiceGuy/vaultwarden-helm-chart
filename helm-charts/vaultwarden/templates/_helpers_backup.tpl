{{- define "backup.name" -}}
{{- printf "%s-%s" .Chart.Name "backup" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "backup.fullname" -}}
{{- $name := .Chart.Name }}
{{- if contains $name .Release.Name }}
{{- printf "%s-%s" .Release.Name "backup" | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s-%s" .Release.Name "backup" $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{- define "backup.labels" -}}
helm.sh/chart: {{ include "vaultwarden.chart" . }}
{{ include "backup.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "backup.selectorLabels" -}}
app.kubernetes.io/name: {{ include "backup.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
