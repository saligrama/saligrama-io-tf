resource "cloudflare_zone" "saligrama_io" {
  account_id = var.cloudflare_account_id
  zone       = "saligrama.io"
}

resource "cloudflare_record" "root_saligrama_io_cf_pages" {
  zone_id = cloudflare_zone.saligrama_io.id
  type    = "CNAME"
  name    = "@"
  value   = cloudflare_pages_project.saligrama.subdomain
  proxied = true
}

resource "cloudflare_record" "catshare_saligrama_io_cf_pages" {
  zone_id = cloudflare_zone.saligrama_io.id
  type    = "CNAME"
  name    = "catshare"
  value   = cloudflare_pages_project.catshare.subdomain
  proxied = true
}

resource "cloudflare_record" "root_saligrama_io_google_site_verification" {
  zone_id = cloudflare_zone.saligrama_io.id
  type    = "TXT"
  name    = "@"
  value   = "google-site-verification=Sd6tqhtWevi6UZXQuZKh-XyAYRQFgdLa1L0XQSyqST8"
}

resource "cloudflare_record" "root_saligrama_io_spf" {
  zone_id = cloudflare_zone.saligrama_io.id
  type    = "TXT"
  name    = "@"
  value   = "v=spf1 include:_spf.google.com ~all"
}

resource "cloudflare_record" "_dmarc_saligrama_io" {
  zone_id = cloudflare_zone.saligrama_io.id
  type    = "TXT"
  name    = "_dmarc"
  value   = "v=DMARC1; p=none; rua=mailto:dmarc@saligrama.io"
}

resource "cloudflare_record" "google_domainkey_saligrama_io" {
  zone_id = cloudflare_zone.saligrama_io.id
  type    = "TXT"
  name    = "google._domainkey"
  value   = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAhlCYGbwJJMAtyE6Fz6mEQDwVL9B3fEZSSfgQ9RrdBdOwpqfr8Ui3ZA6yeWSUE06p0/AfGgqYiTNF91P0BflwQb3IdsY+PggFwWzr7I+ZJIgKcfPuPEk+62DuuU+HIf9y+X+jl5IEQvsbEEqEcainzCXQz/N1uCL80kYev9h+UETMaBIayVdDWQ7Iw/4HUely3mZHh/y4Af66Ggv/Gs2EBUAH3jjj9HRL/a4mOe9p6DOigkkemMFe+gCjWUK9tjTifQSOR/WC26fzDRHBbkOJc6YWdJfxNIM+4qHSxZYzRuThYfk/+CMtwaoJdQvBwG9pp+w0W7zv+zkmyfzey5bEFQIDAQAB"
}

resource "cloudflare_record" "mx_aspmx_google_saligrama_io" {
  zone_id  = cloudflare_zone.saligrama_io.id
  name     = "@"
  value    = "aspmx.l.google.com"
  type     = "MX"
  priority = 1
}

resource "cloudflare_record" "mx_alt1_google_saligrama_io" {
  zone_id  = cloudflare_zone.saligrama_io.id
  name     = "@"
  value    = "alt1.aspmx.l.google.com"
  type     = "MX"
  priority = 5
}

resource "cloudflare_record" "mx_alt_google_saligrama_io" {
  zone_id  = cloudflare_zone.saligrama_io.id
  name     = "@"
  value    = "alt2.aspmx.l.google.com"
  type     = "MX"
  priority = 5
}

resource "cloudflare_record" "mx_alt3_google_saligrama_io" {
  zone_id  = cloudflare_zone.saligrama_io.id
  name     = "@"
  value    = "alt3.aspmx.l.google.com"
  type     = "MX"
  priority = 10
}

resource "cloudflare_record" "mx_alt4_google_saligrama_io" {
  zone_id  = cloudflare_zone.saligrama_io.id
  name     = "@"
  value    = "alt4.aspmx.l.google.com"
  type     = "MX"
  priority = 10
}

resource "cloudflare_zone" "root_sad_singles" {
  account_id = var.cloudflare_account_id
  zone       = "sad.singles"
}

resource "cloudflare_record" "root_sad_singles" {
  zone_id = cloudflare_zone.root_sad_singles.id
  name    = "@"
  value   = cloudflare_pages_project.sadsingles.subdomain
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_web_analytics_site" "saligrama_io" {
  account_id      = var.cloudflare_account_id
  zone_id         = cloudflare_zone.saligrama_io.id
  auto_install    = true
}

resource "cloudflare_web_analytics_site" "root_sad_singles" {
  account_id      = var.cloudflare_account_id
  zone_id         = cloudflare_zone.root_sad_singles.id
  auto_install    = true
}