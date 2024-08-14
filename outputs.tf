output "network_id" {
  value = module.network.network_id
}

output "subnet_id" {
  value = module.network.subnet_id
}

output "storage_bucket_name" {
  value = module.storage_bucket.bucket_name
}

output "load_balancer_ip" {
  value = module.load_balancer.load_balancer_ip
}

output "bucket_url" {
  value = module.storage_bucket.bucket_url
}


