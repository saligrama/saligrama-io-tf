resource "cloudflare_zone" "saligrama.io" {
  account_id = var.cloudflare_account_id
  zone       = "saligrama.io"
}
