# Backstage Runbook
## Port-forward
```bash
kubectl --context k3d-idp-mgmt -n backstage port-forward svc/backstage 7007:7007
```
