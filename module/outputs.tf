output "jwt_mount" {
  description = "Path of the Vault JWT auth mount configured for the Kubernetes cluster."
  value       = local.jwt_mount
}