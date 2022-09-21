# Flows
A collection of callable GitHub workflows

## Workflows
- [OCI Build](./.github/workflows/oci-build-image.yml)
  - Builds OCI images for docker repositories
- [Helm QA](./.github/workflows/helm-qa.yml)
  - Runs the helm chart testing tool, kubeval, checks the docs and does a test deploy against the currently supported k8s releases.
- [Helm Release](./.github/workflows/helm-release.yml)
  - Runs the chart releaser action to publish charts to a github pages repo