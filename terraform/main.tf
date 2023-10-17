resource "github_repository" "nebula_lighthouse_terraform" {
  name        = "nebula-lighthouse-terraform"
  description = "Nebula infrastructure using terraform"
  private     = false
}

resource "digitalocean_ssh_key" "default" {
  name       = "Macbook Air"
  public_key = file("/Users/annemacedo/.ssh/id_ed25519.pub")
}

resource "digitalocean_droplet" "nebula" {
  image     = "debian-12-x64"
  name      = "nebula"
  region    = "nyc1"
  size      = "s-1vcpu-1gb"
  ssh_keys  = [digitalocean_ssh_key.default.fingerprint]
  user_data = file("nebula.yaml")
}

data "cloudflare_accounts" "retpolanne" {
  name = "retpolanne"
}

data "cloudflare_zone" "retpolannedotcom" {
  account_id = data.cloudflare_accounts.retpolanne.id
  zone_id    = var.zone_id
}

resource "cloudflare_record" "nebula" {
  zone_id = data.cloudflare_zone.retpolannedotcom.id
  name    = "nebula"
  value   = digitalocean_droplet.nebula.ipv4_address
  type    = "A"
}
