# TODO - gcp-devops-project Terraform free-credits friendly completion

- [x] Implement `modules/network` subnet resource + outputs (`vpc_id`, `subnet_id`).

- [x] Implement `modules/compute` VM resource with low-cost defaults and **no external IP**.
- [x] Add/adjust variables needed by both modules so `environments/dev/main.tf` can plan/apply.

- [ ] Run `terraform init`, `terraform validate`, and `terraform plan` from `environments/dev`.


