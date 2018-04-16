provider ibm {}

//  This security group allows public ingress to the instances for HTTP, HTTPS
//  and common HTTP/S proxy ports.

resource "ibm_security_group" "openshift-public-ingress" {
  name        = "${var.name}"
  description = "${var.description}"
}

resource "ibm_security_group_rule" "openshift-public-ingress_rule1" {
  direction         = "ingress"
  port_range_min    = "8080"
  port_range_max    = "8080"
  protocol          = "tcp"
  security_group_id = "${ibm_security_group.openshift-public-ingress.id}"
}

resource "ibm_security_group_rule" "openshift-public-ingress_rule2" {
  direction         = "ingress"
  port_range_min    = "80"
  port_range_max    = "80"
  protocol          = "tcp"
  security_group_id = "${ibm_security_group.openshift-public-ingress.id}"
}

resource "ibm_security_group_rule" "openshift-public-ingress_rule3" {
  direction         = "ingress"
  port_range_min    = "443"
  port_range_max    = "443"
  protocol          = "tcp"
  security_group_id = "${ibm_security_group.openshift-public-ingress.id}"
}

resource "ibm_security_group_rule" "openshift-public-ingress_rule4" {
  direction         = "ingress"
  port_range_min    = "8443"
  port_range_max    = "8443"
  protocol          = "tcp"
  security_group_id = "${ibm_security_group.openshift-public-ingress.id}"
}


resource "ibm_security_group" "openshift-public-egress" {
  name        = "${var.name}"
  description = "${var.description}"
}

resource "ibm_security_group_rule" "openshift-public-egress_rule1" {
  direction         = "egress"
  port_range_min    = "80"
  port_range_max    = "80"
  protocol          = "tcp"
  security_group_id = "${ibm_security_group.openshift-public-egress.id}"
}

resource "ibm_security_group_rule" "openshift-public-egress_rule2" {
  direction         = "egress"
  port_range_min    = "443"
  port_range_max    = "443"
  protocol          = "tcp"
  security_group_id = "${ibm_security_group.openshift-public-egress.id}"
}



resource "ibm_security_group" "openshift-ssh" {
  name        = "${var.name}"
  description = "${var.description}"
}

resource "ibm_security_group_rule" "openshift-ssh_rule" {
  direction         = "ingress"
  port_range_min    = "22"
  port_range_max    = "22"
  protocol          = "tcp"
  security_group_id = "${ibm_security_group.openshift-ssh.id}"
}

#Variable

variable "name" {
  default     = "security_grp"
  description = "Name of the security group"
}

variable "description" {
  default     = "security grp for vms"
  description = "Description of the security group"
}

# Outputs
output "openshift_public_ingress_id" {
  value = "${ibm_security_group.openshift-public-ingress.id}"
}

output "openshift_public_egress_id" {
  value = "${ibm_security_group.openshift-public-egress.id}"
}

output "openshift_ssh_id" {
  value = "${ibm_security_group.openshift-ssh.id}"
}




