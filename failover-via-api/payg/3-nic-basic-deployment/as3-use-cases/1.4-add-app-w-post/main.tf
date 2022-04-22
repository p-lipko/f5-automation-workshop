# AS3 - sharing of objects
# Application in a Tenant making use of /Common objects
terraform {
  required_version = "~> 1.1.4"
  required_providers {
    bigip = {
      source = "F5Networks/bigip"
      version = "1.13.1"
    }
  }
}

provider "azurerm" {
  //  version = "~>2.0"
  features {}
}

locals {
  setup = yamldecode(file(var.setupfile))
  hostname = data.azurerm_public_ip.bigip0_mgmt_pip.ip_address
}

provider "bigip" {
  address  = local.hostname
  username = local.setup.bigip.user_name
  password = local.setup.bigip.user_password
}

data azurerm_public_ip "bigip0_mgmt_pip" {
  name = "${local.setup.azure.prefix}-bigip0-mgmt-pip"
  resource_group_name = "${local.setup.azure.prefix}"
}

locals {
    use_case_4_json = templatefile("${path.module}/use_case_4.tpl", {
      vip-6        = local.setup.vips.vip-6
      poolmember-2 = local.setup.web.poolmember-2
  })
}

# BIGIP AS3 Builder
resource "bigip_as3" "as3_use_case_4" {
  as3_json = local.use_case_4_json
}
