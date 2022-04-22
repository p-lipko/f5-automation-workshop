# output.terraform

output "App_Services" {
  value = <<EOF

      vip-1-http  : http://${local.setup.vips.vip-1}
      vip-2-http  : http://${local.setup.vips.vip-2}
      vip-2-https : https://${local.setup.vips.vip-2}
      poolmember-1: ${local.setup.web.poolmember-1}
    EOF
}