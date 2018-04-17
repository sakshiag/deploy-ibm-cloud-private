provider "ibm" {}

module "storage_infranode" {
  source     = "../storage_infranode"
  datacenter = "${var.datacenter}"
}


resource "ibm_compute_vm_instance" "infranode" {
    count                     = "${var.node_count}"
    os_reference_code         = "${var.vm-os-reference-code}"
    hostname                  = "${var.vm-hostname}"
    domain                    = "${var.vm-domain}"
    datacenter                = "${var.datacenter}"
    file_storage_ids          = ["${module.storage_infranode.infranodefileid}"]
    private_network_only      = true
    network_speed             = 100
    local_disk                = false
    flavor_key_name           = "${var.flavor_key_name}"
    disks                     = [25,25,25]
    ssh_key_ids               = ["${var.ssh_key_id}"]
    local_disk                = false
    private_vlan_id           = "${var.private_vlan_id}"
    public_security_group_ids = ["${var.openshift-public-ingress}", "${var.openshift-public-egress}"]
  }




//Variables

variable "ssh_key_id"{
  
}
variable "openshift-public-ingress"{}
variable "openshift-public-egress"{}

variable "node_count" {
  
}

variable "datacenter" {
  
}

variable "vm-hostname" {
  default = "infranode-3tier"
}

variable "vm-domain" {}

variable "flavor_key_name" {
  default = "B1_4X8X100"
}

variable "vm-os-reference-code" {
  default = "REDHAT_7_64"
}

variable "private_vlan_id" {}


output "infra_ip_address_id"{

  value = "${ibm_compute_vm_instance.infranode.*.ip_address_id_private}"
}
