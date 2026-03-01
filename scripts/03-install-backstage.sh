#!/usr/bin/env bash
set -euo pipefail
CTX="k3d-idp-mgmt"
NS="backstage"
helm repo add backstage https://backstage.github.io/charts
helm repo update
kubectl --context "$CTX" create namespace "$NS" --dry-run=client -o yaml | kubectl --context "$CTX" apply -f -
helm upgrade --install backstage backstage/backstage --kube-context "$CTX" --namespace "$NS" -f ../clusters/mgmt/backstage/values.yaml
echo "Done."
