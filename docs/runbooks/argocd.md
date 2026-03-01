# Argo CD Runbook
## Get initial admin password
```bash
kubectl --context k3d-idp-mgmt -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```

## Port-forward
```bash
kubectl --context k3d-idp-mgmt -n argocd port-forward svc/argocd-server 8080:443
```
