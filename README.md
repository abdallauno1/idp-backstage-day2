# Enterprise Internal Developer Platform (IDP) – Day 2
**Author:** Abdalla Mady — DevOps Engineer

## Day 2 Goal
Deliver a **Golden Path** experience: from Backstage you can scaffold a new microservice repository skeleton that is:
- GitOps-ready (Kustomize overlays)
- CI-enabled (lint/validate manifests + SBOM)
- Catalog-ready (`catalog-info.yaml` + TechDocs skeleton)

Day 1 baseline is included (Backstage + Argo CD + sample app deployed via GitOps).

---

## What’s added in Day 2
### Backstage
- **Scaffolder Template**: `FastAPI Service (Golden Path)`
- Catalog includes:
  - a sample `Component`
  - a `Template` entity for scaffolding
  - TechDocs baseline

### CI (GitHub Actions)
A pipeline blueprint that:
- validates Kubernetes YAML with **kubeconform**
- runs **Trivy** filesystem scan
- generates **SBOM** via **Syft**
- uploads SBOM as a build artifact

---

## Architecture (Day 2)
See:
- `diagrams/day2-architecture.mmd` (Mermaid source)
- `diagrams/day2-architecture.png` (exported image with signature)

---

## Quickstart (local demo with k3d)
```bash
cd scripts
./01-create-clusters.sh
./02-install-argocd.sh
./03-install-backstage.sh
REPO_URL="https://github.com/<YOUR_GITHUB>/idp-platform-day2.git" ./04-bootstrap-gitops.sh
```

### Use the Golden Path template
1) Port-forward Backstage:
```bash
kubectl --context k3d-idp-mgmt -n backstage port-forward svc/backstage 7007:7007
```
2) Open Backstage → **Create** → **FastAPI Service (Golden Path)**
3) Fill: name, owner, description

> For portfolio, this repo also includes a **reference output** at:
> `templates/output/fastapi-goldenpath-example/`

---

## Day 2 Acceptance Criteria
- [ ] Backstage shows the **Template** in “Create”
- [ ] Template produces a service skeleton (reference output provided)
- [ ] CI workflow validates manifests and creates SBOM artifact
- [ ] Service skeleton includes TechDocs + kustomize overlays + catalog entity

---

## Next (Day 3)
- Multi-tenancy (namespaces per team + RBAC)
- Policy-as-Code guardrails (Kyverno)
- Scorecards / compliance checks in Backstage
