#!/usr/bin/env bash
set -euo pipefail
REPO_URL="${REPO_URL:-https://github.com/abdallauno1/idp-backstage-day2.git}"
REVISION="${REVISION:-main}"
CTX="k3d-idp-mgmt"
cat <<EOF | kubectl --context "$CTX" apply -f -
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: idp-app-of-apps
  namespace: argocd
spec:
  project: default
  source:
    repoURL: ${REPO_URL}
    targetRevision: ${REVISION}
    path: gitops/app-of-apps
  destination:
    server: https://kubernetes.default.svc
    namespace: argocd
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
EOF
echo "Done. Export REPO_URL to your GitHub repo."
