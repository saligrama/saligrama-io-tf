resource "cloudflare_pages_project" "saligrama" {
  account_id        = var.cloudflare_account_id
  name              = "saligrama"
  production_branch = "main"

  source {
    type = "github"
    config {
      owner                         = "saligrama"
      repo_name                     = "web"
      production_branch             = "main"
      deployments_enabled           = true
      production_deployment_enabled = true
    }
  }

  build_config {
    build_command   = "npm i --force && hugo --gc --minify"
    destination_dir = "public"
    root_dir        = ""
  }

  deployment_configs {
    production {
      environment_variables = {
        SKIP_DEPENDENCY_INSTALL = true
      }
    }
  }
}

resource "cloudflare_pages_domain" "saligrama" {
  account_id   = var.cloudflare_account_id
  project_name = cloudflare_pages_project.saligrama.name
  domain       = "saligrama.io"
}

resource "cloudflare_pages_project" "saligrama-notes" {
  account_id        = var.cloudflare_account_id
  name              = "saligrama-notes"
  production_branch = "hugo-dev"

  source {
    type = "github"
    config {
      owner                         = "saligrama"
      repo_name                     = "notes"
      production_branch             = "hugo-dev"
      deployments_enabled           = true
      production_deployment_enabled = true
    }
  }

  build_config {
    build_command   = "hugo --gc --minify"
    destination_dir = "public"
    root_dir        = ""
  }
}

resource "cloudflare_pages_project" "saligrama-photo" {
  account_id        = var.cloudflare_account_id
  name              = "saligrama-photo"
  production_branch = "main"

  source {
    type = "github"
    config {
      owner                         = "saligrama"
      repo_name                     = "photo"
      production_branch             = "main"
      deployments_enabled           = true
      production_deployment_enabled = true
    }
  }

  build_config {
    build_command   = "hugo --gc --minify"
    destination_dir = "public"
    root_dir        = ""
  }
}

resource "cloudflare_pages_project" "sadsingles" {
  account_id        = var.cloudflare_account_id
  name              = "sadsingles"
  production_branch = "main"

  source {
    type = "github"
    config {
      owner                         = "saligrama"
      repo_name                     = "sadsingles"
      production_branch             = "main"
      deployments_enabled           = true
      production_deployment_enabled = true
    }
  }
}

resource "cloudflare_pages_domain" "sadsingles" {
  account_id   = var.cloudflare_account_id
  project_name = cloudflare_pages_project.sadsingles.name
  domain       = "sad.singles"
}

resource "cloudflare_pages_project" "catshare" {
  account_id        = var.cloudflare_account_id
  name              = "catshare"
  production_branch = "main"

  source {
    type = "github"
    config {
      owner                         = "saligrama"
      repo_name                     = "catshare-serverless"
      production_branch             = "main"
      deployments_enabled           = true
      production_deployment_enabled = true
    }
  }

  deployment_configs {
    production {
      d1_databases = {
        USERS_DB = cloudflare_d1_database.catshare_db.id
      }
    }
  }
}

resource "cloudflare_d1_database" "catshare_db" {
  account_id = var.cloudflare_account_id
  name       = "catshare"
}

resource "cloudflare_pages_domain" "catshare" {
  account_id   = var.cloudflare_account_id
  project_name = cloudflare_pages_project.catshare.name
  domain       = "catshare.saligrama.io"
}

resource "cloudflare_pages_project" "transitdiary" {
  account_id        = var.cloudflare_account_id
  name              = "transitdiary"
  production_branch = "main"

  source {
    type = "github"
    config {
      owner                         = "saligrama"
      repo_name                     = "transitdiary"
      production_branch             = "main"
      deployments_enabled           = true
      production_deployment_enabled = true
    }
  }
}

resource "cloudflare_d1_database" "transitdiary_db" {
  account_id = var.cloudflare_account_id
  name       = "transitdiary"
}
