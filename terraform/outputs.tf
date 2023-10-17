output "ipv4_address" {
  description = "IPv4 address of the droplet"
  value       = digitalocean_droplet.nebula.ipv4_address
}
