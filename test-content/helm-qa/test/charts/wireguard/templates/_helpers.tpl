{{/*
Expand the name of the chart.
*/}}
{{- define "wireguard.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "wireguard.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "wireguard.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "wireguard.selectorLabels" -}}
app.kubernetes.io/name: {{ include "wireguard.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "wireguard.labels" -}}
helm.sh/chart: {{ include "wireguard.chart" . }}
{{ include "wireguard.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{/* Seccomp profile partial */}}
{{- define "wireguard.seccompProfile" -}}
{{- if .Values.securityContext.seccompProfile }}
seccompProfile: {{ .Values.securityContext.seccompProfile | toYaml | nindent 2}}
{{- end }}
{{- end -}}

{{/* Runtime Class partial */}}
{{- define "wireguard.runtimeClass" }}
{{- if .Values.runtimeClassName }}
runtimeClassName: "{{ .Values.runtimeClassName }}"
{{- end }}
{{- end }}