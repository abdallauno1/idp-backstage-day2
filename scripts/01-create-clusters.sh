#!/usr/bin/env bash
set -euo pipefail
k3d cluster create idp-mgmt --agents 1 --servers 1 --k3s-arg "--disable=traefik@server:0"
k3d cluster create idp-dev  --agents 1 --servers 1 --k3s-arg "--disable=traefik@server:0"
kubectl config get-contexts | grep k3d-idp || true
echo "Done."
