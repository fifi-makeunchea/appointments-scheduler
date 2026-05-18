# Appointments Scheduler — Serverless on AWS

A production-style hair-salon appointment booking service, built to demonstrate
real Cloud/DevOps practice: infrastructure as code, CI/CD, automated testing,
and observability — all deployed on AWS.

> 🚧 **Status:** in active development. Built in public, phase by phase.

## Architecture

```
Browser ──▶ CloudFront ──▶ S3 (private SPA)
   │
   └──▶ API Gateway (HTTP API) ──▶ Lambda (Python) ──▶ DynamoDB
                                       │
                                       ▼
                                  CloudWatch (logs, metrics, alarms)

All infrastructure is defined in Terraform · Shipped by GitHub Actions via OIDC
```

## Tech stack

| Layer | Choice |
|---|---|
| Compute | AWS Lambda (Python 3.13) |
| API | API Gateway (HTTP API) |
| Data | DynamoDB |
| Frontend | Static SPA on S3 + CloudFront |
| IaC | Terraform (S3 remote state, native locking) |
| CI/CD | GitHub Actions (OIDC, no long-lived keys) |
| Observability | CloudWatch metrics, alarms, structured logs |

See [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) for design rationale and trade-offs.

## License

MIT — see [LICENSE](LICENSE).
