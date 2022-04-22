# AS3 - A more layered approach to have better control
# when adding or deleting applications
# terraform apply -target="bigip_as3.app_services_tenant_1" -var-file ./data/tenant1/terraform.tfvars
# terraform apply -target="local_file.app_services_tenant_1" -var-file ./data/tenant1/terraform.tfvars

terraform {
  required_version = "~> 1.1.4"
  required_providers {
    bigip = {
      //source = "terraform-providers/bigip"
      source = "F5Networks/bigip"
      version = "1.13.1"
    }
  }
}

provider "azurerm" {
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
  apps_json = templatefile("${path.module}/templates/application.json.tpl", {
      apps = var.applications
  })
  tenant_json = templatefile("${path.module}/templates/tenant.json.tpl", {
      application_payload = local.apps_json
      tenant_name         = var.tenant_name
  })

  as3_json = templatefile("${path.module}/templates/as3.json.tpl", {
      tenant_payload = local.tenant_json
  })
}


# Application Deployments !!!TENANT1!!!
resource "bigip_as3" "as3_tenant_1" {
  as3_json = local.as3_json
}

# for debug purposes 
resource "local_file" "as3_tenant_1" {
    content     = local.as3_json
    filename = "${path.module}/as3_tenant_1.json"
}

resource "bigip_as3" "as3_tenant_2" {
  as3_json = local.as3_json
}

# Application Deployments !!!TENANT2!!!
# for debug purposes 
resource "local_file" "as3_tenant_2" {
    content     = local.as3_json
    filename = "${path.module}/as3_tenant_2.json"
}