# Documentation for load_balancer

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_cloud_run_service.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service) | resource |
| [google_compute_backend_service.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_backend_service) | resource |
| [google_compute_firewall.allow-health-check](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.allow-http](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.allow-https](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_global_address.static_ip](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address) | resource |
| [google_compute_global_forwarding_rule.forwarding_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_forwarding_rule) | resource |
| [google_compute_global_forwarding_rule.https](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_forwarding_rule) | resource |
| [google_compute_health_check.http](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_health_check) | resource |
| [google_compute_managed_ssl_certificate.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_managed_ssl_certificate) | resource |
| [google_compute_network_endpoint_group.cloud_run_neg](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_endpoint_group) | resource |
| [google_compute_target_http_proxy.http_proxy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_http_proxy) | resource |
| [google_compute_target_https_proxy.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_https_proxy) | resource |
| [google_compute_url_map.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_url_map) | resource |
| [google_compute_url_map.http_to_https_redirect](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_url_map) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_run_service_name"></a> [cloud\_run\_service\_name](#input\_cloud\_run\_service\_name) | The cloud run name | `string` | n/a | yes |
| <a name="input_load_balancer_name"></a> [load\_balancer\_name](#input\_load\_balancer\_name) | The name of the load balancer | `string` | n/a | yes |
| <a name="input_network"></a> [network](#input\_network) | The network to attach the VM | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The GCP project ID | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region to deploy resources | `string` | `"us-central1"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | The zone to deploy the VM | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloud_run_url"></a> [cloud\_run\_url](#output\_cloud\_run\_url) | n/a |
| <a name="output_global-static-ip"></a> [global-static-ip](#output\_global-static-ip) | n/a |
| <a name="output_load_balancer_ip"></a> [load\_balancer\_ip](#output\_load\_balancer\_ip) | n/a |

