resource "cloudflare_zone" "saligrama_io" {
  account_id = var.cloudflare_account_id
  zone       = "saligrama.io"
}
