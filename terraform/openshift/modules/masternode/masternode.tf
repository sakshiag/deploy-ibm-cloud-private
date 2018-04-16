provider "ibm" {}

module "storage_masternode" {
  source     = "../storage_masternode"
  datacenter = "${var.datacenter}"
}

/*module "firewall" {
  source = "../firewall_masternode"
}*/




resource "ibm_compute_vm_instance" "masternode" {

    os_reference_code         = "${var.vm-os-reference-code}"
    hostname                  = "${var.vm-hostname}"
    domain                    = "${var.vm-domain}"
    datacenter                = "${var.datacenter}"
    block_storage_ids         = ["${module.storage_masternode.masterblockid}"]
    private_network_only      = "true"
    network_speed             = 100
    local_disk                = false
    flavor_key_name           = "${var.flavor_key_name}"
    disks                     = [25,25,25]
    ssh_key_ids               = ["${var.ssh_key_id}"]
    private_vlan_id           = "${var.private_vlan_id}"
    public_security_group_ids = ["${var.openshift-public-ingress}", "${var.openshift-public-egress}"]
    post_install_script_uri   = "${var.vm-post-install-script-uri}"
  }


//Variables
variable "ssh_key_id"{
  
}
variable "openshift-public-ingress"{}
variable "openshift-public-egress"{}


variable "datacenter" {
}

variable "vm-hostname" {
  default = "masternode-openshift"
}

variable "vm-domain" {}

variable "flavor_key_name" {
  default = "B1_4X8X100"
}

variable "vm-os-reference-code" {
  default = "REDHAT_7_64"
}

variable "vm-post-install-script-uri" {
  default = "https://raw.github.ibm.com/sakshiag/iaas_ref_architectures/openshift-sakshi/terraform/openshift/ClassicSoftlayer-openshift/modules/autoscale_masternode/nginx.sh"
}

variable "private_vlan_id" {}

output "master_ip_address_id" {

  value = "${ibm_compute_vm_instance.masternode.ip_address_id_private}"
}
