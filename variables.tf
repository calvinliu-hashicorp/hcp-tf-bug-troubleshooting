variable "auth_approle" {
  description = "Whether to configure the AppRole auth role and policy."
  type        = bool
  default     = false
}

variable "approle_mount" {
  description = "Vault auth mount path for AppRole."
  type        = string
  default     = "approle"
}

variable "approle_token_ttl" {
  description = "Initial TTL for tokens issued by the AppRole, in seconds."
  type        = number
  default     = 3600
}

variable "approle_token_max_ttl" {
  description = "Maximum TTL for tokens issued by the AppRole, in seconds."
  type        = number
  default     = 7200
}

variable "approle_secret_id_ttl" {
  description = "TTL for AppRole Secret IDs, in seconds; zero means no expiration."
  type        = number
  default     = 0
}

variable "approle_secret_id_num_uses" {
  description = "Maximum uses for an AppRole Secret ID; zero means unlimited."
  type        = number
  default     = 0
}

variable "k8s_cluster_name" {
  description = "Cluster name used to identify the AppRole and scope its policy."
  type        = string
  default     = "my-k8s-cluster"
}