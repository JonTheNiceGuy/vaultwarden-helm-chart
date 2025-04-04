{{- define "metrics.name" -}}
{{- printf "%s-%s" .Chart.Name "metrics" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "metrics.fullname" -}}
{{- $name := .Chart.Name }}
{{- if contains $name .Release.Name }}
{{- printf "%s-%s" .Release.Name "metrics" | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s-%s" .Release.Name "metrics" $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{- define "metrics.labels" -}}
helm.sh/chart: {{ include "vaultwarden.chart" . }}
{{ include "metrics.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "metrics.selectorLabels" -}}
app.kubernetes.io/name: {{ include "metrics.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
