# === kubernetes

resource "cloudflare_record" "k8s_base_domain" {
    name = "k8s"
    value = var.kubernetes_ip
    type = "A"
    zone_id = var.zone_id
}

resource "cloudflare_record" "k8s_base_domain_ipv6" {
    name = "k8s"
    value = var.kubernetes_ipv6
    type = "AAAA"
    zone_id = var.zone_id
}

resource "cloudflare_record" "base_domain" {
    name = var.base_domain
    value = var.kubernetes_domain
    type = "CNAME"
    proxied = var.proxy_kubernetes_cname
    zone_id = var.zone_id
}

resource "cloudflare_record" "wildcard_base_domain" {
    name = "*"
    value = var.kubernetes_domain
    type = "CNAME"
    proxied = var.proxy_kubernetes_cname
    zone_id = var.zone_id
}

resource "cloudflare_record" "wildcard_k8s_base_domain" {
    name = "*.k8s"
    value = var.kubernetes_domain
    type = "CNAME"
    proxied = var.proxy_kubernetes_cname
    zone_id = var.zone_id
}

# === home

resource "cloudflare_record" "home_domain" {
    name = "home"
    value = var.home_ip
    type = "A"
    proxied = var.proxy_home_cnames
    zone_id = var.zone_id
}

resource "cloudflare_record" "ddns" {
    name = "ddns"
    value = var.home_domain
    type = "CNAME"
    proxied = var.proxy_home_cnames
    zone_id = var.zone_id
}

resource "cloudflare_record" "hoas" {
    name = "hoas"
    value = var.home_domain
    type = "CNAME"
    proxied = var.proxy_home_cnames
    zone_id = var.zone_id
}

resource "cloudflare_record" "grocy" {
    name = "grocy"
    value = var.home_domain
    type = "CNAME"
    proxied = var.proxy_home_cnames
    zone_id = var.zone_id
}

resource "cloudflare_record" "grafana" {
    name = "grafana"
    value = var.home_domain
    type = "CNAME"
    proxied = var.proxy_home_cnames
    zone_id = var.zone_id
}

resource "cloudflare_record" "irc" {
    name = "irc"
    value = var.home_domain
    type = "CNAME"
    proxied = var.proxy_home_cnames
    zone_id = var.zone_id
}

resource "cloudflare_record" "octo" {
    name = "octo"
    value = var.home_domain
    type = "CNAME"
    proxied = var.proxy_home_cnames
    zone_id = var.zone_id
}

resource "cloudflare_record" "pihole" {
    name = "pihole"
    value = var.home_domain
    type = "CNAME"
    proxied = var.proxy_home_cnames
    zone_id = var.zone_id
}

resource "cloudflare_record" "plex" {
    name = "plex"
    value = var.home_domain
    type = "CNAME"
    proxied = var.proxy_home_cnames
    zone_id = var.zone_id
}

resource "cloudflare_record" "rss" {
    name = "rss"
    value = var.home_domain
    type = "CNAME"
    proxied = var.proxy_home_cnames
    zone_id = var.zone_id
}

resource "cloudflare_record" "share" {
    name = "share"
    value = var.home_domain
    type = "CNAME"
    proxied = var.proxy_home_cnames
    zone_id = var.zone_id
}

resource "cloudflare_record" "synclounge" {
    name = "synclounge"
    value = var.home_domain
    type = "CNAME"
    proxied = var.proxy_home_cnames
    zone_id = var.zone_id
}

resource "cloudflare_record" "wildcard_syncthing" {
    name = "*.syncthing"
    value = var.home_domain
    type = "CNAME"
    proxied = var.proxy_home_cnames
    zone_id = var.zone_id
}

resource "cloudflare_record" "vpn" {
    name = "vpn"
    value = var.home_domain
    type = "CNAME"
    proxied = var.proxy_home_cnames
    zone_id = var.zone_id
}

resource "cloudflare_record" "zoom" {
    name = "zoom"
    value = var.home_domain
    type = "CNAME"
    proxied = var.proxy_home_cnames
    zone_id = var.zone_id
}


# === other

resource "cloudflare_record" "local_dns" {
    name = "dns"
    value = var.local_dns_ip
    type = "A"
    zone_id = var.zone_id
}

resource "cloudflare_record" "localhost" {
    name = "localhost"
    value = "127.0.0.1"
    type = "A"
    zone_id = var.zone_id
}

resource "cloudflare_record" "localhost_ipv6" {
    name = "localhost"
    value = "::1"
    type = "AAAA"
    zone_id = var.zone_id
}
