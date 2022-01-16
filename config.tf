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

provider "cloudflare" {
  api_token = var.cloudflare_token
}
