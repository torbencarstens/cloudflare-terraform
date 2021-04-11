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

variable "hoas_domain" {
  type    = string
  default = "hoas.carstens.tech"
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

resource "cloudflare_record" "grafana_cname" {
  zone_id = var.zone_id
  name    = "grafana"
  type    = "CNAME"
  value   = var.hoas_domain
  proxied = var.proxy_records
}

resource "cloudflare_record" "hoas_domain_a" {
  zone_id = var.zone_id
  name    = var.hoas_domain
  type    = "A"
  value   = var.home_ip
  proxied = var.proxy_home_ip
}
