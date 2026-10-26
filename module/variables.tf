variable "k8s_cluster_name" {
  type = string
  default = "my-k8s-cluster"
}

variable "k8s_cluster_public_signing_keys" {
  type = list(string)
}