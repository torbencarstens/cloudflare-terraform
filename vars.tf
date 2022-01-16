variable "cloudflare_token" {
  type      = string
  sensitive = true
}

variable "base_domain" {
  type    = string
  default = "carstens.tech"
}

variable "home_domain" {
  type    = string
  default = "home.carstens.tech"
}

variable "kubernetes_domain" {
  type = string
  default = "k8s.carstens.tech"
}

variable "zone_id" {
  type    = string
}

variable "proxy_home_ip" {
    type = bool
    default = false
}

variable "proxy_home_cnames" {
    type = bool
    default = false
}

variable "proxy_kubernetes_ip" {
    type = bool
    default = false
}

variable "proxy_kubernetes_cname" {
    type = bool
    default = false
}

variable "home_ip" {
    type = string
}

variable "local_dns_ip" {
    type = string
    default = "10.10.10.1"
}

variable "kubernetes_ip" {
    type = string
}

variable "kubernetes_ipv6" {
    type = string
}
