resource "cloudflare_pages_project" "saligrama" {
  account_id        = var.cloudflare_account_id
  name              = "saligrama"
  production_branch = "main"

  source {
    type = "github"
    config {
      owner                          = "saligrama"
      repo                           = "saligrama.github.io"
      branch                         = "main"
      deployments_enabled            = true
      production_deployments_enabled = true
    }
  }

  build_config {
    build_command   = "hugo --gc --minify"
    destination_dir = "public"
    root_dir        = ""
  }
}
