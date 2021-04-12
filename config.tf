terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "torbencarstens"

    workspaces {
      name = "dnsrecords"
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 2.0"
    }
  }
}

variable "cloudflare_token" {
  type      = string
  sensitive = true
}

provider "cloudflare" {
  api_token = var.cloudflare_token
}

variable "base_domain" {
  type    = string
  default = "carstens.tech"
}

variable "home_domain" {
  type    = string
  default = "home.carstens.tech"
}

variable "kubernetes_static_files_domain" {
  type    = string
  default = "static-files.carstens.tech"
}

variable "zone_id" {
  type    = string
  default = "6dec3e2deb9c51ea3068a5d944017461"
}

variable "home_ip" {
  type = string
}

variable "proxy_home_ip" {
  type    = bool
}

variable "proxy_home_cnames" {
  type    = bool
}

variable "local_dns_ip" {
  type    = string
}

variable "kubernetes_static_files_ip" {
  type    = string
}

variable "proxy_kubernetes_static_files_ip" {
  type    = bool
}

variable "proxy_kubernetes_static_files_cname" {
  type    = bool
}

variable "clemens_ip" {
  type = string
}

variable "proxy_clemens_ip" {
  type    = bool
}

resource "cloudflare_record" "kubernetes_static_files_a" {
  zone_id = var.zone_id
  name    = var.kubernetes_static_files_domain
  type    = "A"
  value   = var.kubernetes_static_files_ip
  proxied = var.proxy_kubernetes_static_files_ip
}

resource "cloudflare_record" "cv_cname" {
  zone_id = var.zone_id
  name    = "cv"
  type    = "CNAME"
  value   = var.kubernetes_static_files_domain
  proxied = var.proxy_kubernetes_static_files_cname
}

resource "cloudflare_record" "pic_cname" {
  zone_id = var.zone_id
  name    = "pic"
  type    = "CNAME"
  value   = var.kubernetes_static_files_domain
  proxied = var.proxy_kubernetes_static_files_cname
}

resource "cloudflare_record" "trash_cname" {
  zone_id = var.zone_id
  name    = "trash"
  type    = "CNAME"
  value   = var.kubernetes_static_files_domain
  proxied = var.proxy_kubernetes_static_files_cname
}

resource "cloudflare_record" "local_dns_a" {
  zone_id = var.zone_id
  name    = "dns.${var.base_domain}"
  type    = "A"
  value   = var.local_dns_ip
}

resource "cloudflare_record" "home_domain_a" {
  zone_id = var.zone_id
  name    = var.home_domain
  type    = "A"
  value   = var.home_ip
  proxied = var.proxy_home_ip
}

resource "cloudflare_record" "vpn_cname" {
  zone_id = var.zone_id
  name    = "vpn"
  type    = "CNAME"
  value   = var.home_domain
  proxied = var.proxy_home_cnames
}

resource "cloudflare_record" "synclounge_cname" {
  zone_id = var.zone_id
  name    = "synclounge"
  type    = "CNAME"
  value   = var.home_domain
  proxied = var.proxy_home_cnames
}

resource "cloudflare_record" "share_cname" {
  zone_id = var.zone_id
  name    = "share"
  type    = "CNAME"
  value   = var.home_domain
  proxied = var.proxy_home_cnames
}

resource "cloudflare_record" "rss_cname" {
  zone_id = var.zone_id
  name    = "rss"
  type    = "CNAME"
  value   = var.home_domain
  proxied = var.proxy_home_cnames
}

resource "cloudflare_record" "plex_cname" {
  zone_id = var.zone_id
  name    = "plex"
  type    = "CNAME"
  value   = var.home_domain
  proxied = var.proxy_home_cnames
}

resource "cloudflare_record" "pihole_cname" {
  zone_id = var.zone_id
  name    = "pihole"
  type    = "CNAME"
  value   = var.home_domain
  proxied = var.proxy_home_cnames
}

resource "cloudflare_record" "grocy_cname" {
  zone_id = var.zone_id
  name    = "grocy"
  type    = "CNAME"
  value   = var.home_domain
  proxied = var.proxy_home_cnames
}

resource "cloudflare_record" "grafana_cname" {
  zone_id = var.zone_id
  name    = "grafana"
  type    = "CNAME"
  value   = var.home_domain
  proxied = var.proxy_home_cnames
}

resource "cloudflare_record" "ddns_cname" {
  zone_id = var.zone_id
  name    = "ddns"
  type    = "CNAME"
  value   = var.home_domain
  proxied = var.proxy_home_cnames
}

resource "cloudflare_record" "hoas_cname" {
  zone_id = var.zone_id
  name    = "hoas"
  type    = "CNAME"
  value   = var.home_domain
  proxied = var.proxy_home_cnames
}

resource "cloudflare_record" "clemens_a" {
  zone_id = var.zone_id
  name    = "clemens.${var.base_domain}"
  type    = "A"
  value   = var.clemens_ip
  proxied = var.proxy_clemens_ip
}

resource "cloudflare_record" "localhost_a" {
  zone_id = var.zone_id
  name    = "localhost.${var.base_domain}"
  type    = "A"
  value   = "127.0.0.1"
}

resource "cloudflare_record" "localhost_aaaa" {
  zone_id = var.zone_id
  name    = "localhost.${var.base_domain}"
  type    = "AAAA"
  value   = "::1"
}

resource "cloudflare_record" "zoom_cname" {
  zone_id = var.zone_id
  name    = "zoom.${var.base_domain}"
  type    = "CNAME"
  value   = "home"
  proxied = false
}

resource "cloudflare_record" "zoom_txt" {
  zone_id = var.zone_id
  name    = "zoom.${var.base_domain}"
  type    = "TXT"
  value   = "0qqlHG0qpWPuClpj61wHa4-bqW6i2hozZrdX2OxfhCA"
}

