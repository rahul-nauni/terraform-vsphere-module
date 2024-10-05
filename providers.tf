# PROVIDERS CONFIG
terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.9.2"
    }
    infoblox = {
      source  = "infobloxopen/infoblox"
      version = ">= 2.7.0"
    }
  }
}
