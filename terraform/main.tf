#data "cloudflare_accounts" "retpolanne" {
#  name = "retpolanne"
#}
#
#data "cloudflare_zone" "retpolannedotcom" {
#  account_id = data.cloudflare_accounts.retpolanne.id
#  zone_id    = "retpolanne.com"
#}
#
#resource "cloudflare_record" "nebula" {
#  zone_id = data.cloudflare_zone.retpolannedotcom.id
#  name    = "nebula"
#  value   = ""
#  type    = "A"
#}
#
resource "github_repository" "nebula_lighthouse_terraform" {
  name        = "nebula-lighthouse-terraform"
  description = "Nebula infrastructure using terraform"
  private      = false
}
