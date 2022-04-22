# output.terraform

output "App_Services" {
  value = <<EOF

      vip-6-http  : http://${local.setup.vips.vip-6}
      poolmember-2: ${local.setup.web.poolmember-2}
    EOF
}