# Architecture & Design Decisions

## Overview

A serverless appointment-booking service. Customers pick a service and book a
time slot; the system prevents double-booking of a hairdresser.

## Component diagram

```
Browser ──▶ CloudFront ──▶ S3 (private SPA, OAC)
   │
   └──▶ API Gateway (HTTP API) ──▶ Lambda (Python) ──▶ DynamoDB
                                       │
                                       ▼
                                  CloudWatch (logs, metrics, alarms)
```

## Key decisions & trade-offs

| Decision | Why | Trade-off accepted |
|---|---|---|
| Serverless (Lambda/API GW/DynamoDB) | Scales to zero → near-zero cost; no servers to patch | Cold starts; vendor coupling |
| Terraform for all infra | Most in-demand IaC; declarative; cloud-agnostic | More verbose than CDK |
| Remote state (S3 backend, native locking) | Safe collaboration; prevents concurrent-apply corruption. Uses Terraform's native `use_lockfile` (≥1.10) — the legacy DynamoDB lock table is no longer required | Requires Terraform ≥ 1.10 |
| GitHub Actions + OIDC | Short-lived creds; no long-lived keys stored in CI | OIDC trust setup complexity |
| DynamoDB (not RDS) | Predictable single-digit-ms reads; no idle DB cost | No ad-hoc SQL; model access patterns up front |
| Coverage-gated CI | Quality enforced by pipeline, not goodwill | Slower merges if tests lag |

## Out of scope (deliberately)

- Authentication/authorization (documented as a future extension)
- Payment processing
- Multi-region / DR
