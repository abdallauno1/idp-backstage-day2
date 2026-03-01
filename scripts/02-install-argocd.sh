#!/usr/bin/env bash
set -euo pipefail
CTX="k3d-idp-mgmt"
kubectl --context "$CTX" create namespace argocd --dry-run=client -o yaml | kubectl --context "$CTX" apply -f -
kubectl --context "$CTX" apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl --context "$CTX" -n argocd rollout status deploy/argocd-server --timeout=300s
echo "Done."
