# output.terraform

output "App_Services" {
  value = <<EOF

      vip-5-http  : http://${local.setup.vips.vip-5}
    EOF
}