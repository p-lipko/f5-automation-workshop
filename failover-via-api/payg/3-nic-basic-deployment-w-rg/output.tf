# Output

output "BIGIP_MGMT" {
  value = <<EOF

      bigip0-mgmt : https://${azurerm_public_ip.bigip0_mgmt_pip.ip_address}
      bigip1-mgmt : https://${azurerm_public_ip.bigip1_mgmt_pip.ip_address}
    EOF
}

# output "SSH_Public_Key" {
#   value = azurerm_ssh_public_key.f5_key.public_key
# }

# output "ALB_Public_IP" {
#   description = "The assigned public ip address"
#   value       = azurerm_public_ip.alb_pip.ip_address
# }

# output "App_HTTP" {
#   description = "Application HTTP link"
#   value       = "http://${azurerm_public_ip.alb_pip.ip_address}"
# }

# output "App_HTTPS" {
#   description = "Application HTTPS link"
#   value       = "https://${azurerm_public_ip.alb_pip.ip_address}"
# }