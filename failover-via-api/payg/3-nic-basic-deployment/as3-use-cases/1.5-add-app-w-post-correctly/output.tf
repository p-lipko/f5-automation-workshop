# output.terraform

output "App_Services" {
  value = <<EOF

      vip-3-http  : http://${local.setup.vips.vip-3}
      vip-4-http  : http://${local.setup.vips.vip-4}
      vip-4-https : https://${local.setup.vips.vip-4}
      vip-5-http  : http://${local.setup.vips.vip-5}
      vip-6-http  : http://${local.setup.vips.vip-6}
      poolmember-2: ${local.setup.web.poolmember-2}
    EOF
}