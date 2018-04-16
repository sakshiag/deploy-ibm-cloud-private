variable "datacenter" {
    default = "dal05"
}

variable "infra_count" {
    default = 3
}

variable "app_count" {
    default = 2
}

variable "ssh_public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCyUwkRCP2wILFMU+z3ZMk2ZotKVZruGeeg+nNaqDuKzoRpjhPX/V9HcPNlGi+vBD2ojSqPx7+UdbZGmn95kAldXbIxQ7SBrDlztcEMsnJb4H8VKL0NzYNOYlY4zQO1ioDriaJdm89TjEIooNHM+BGuoyxxbwHhsJrOFkdY4aezbO9XdhaM1OKYgjx8ezRZYiFL2DrZ1gvI4oKbAEAbUg+idcLuEjYRekHVj5hmw+4WX1FIOc/LYxEirhNWnXXKjsizZNq8x/CA9G9MLPEmEnadeL78OTEfxCuPs2ByNLuOHjN/Rx9QEkzpxzAnlSiQpR6ErtamVuCci9Eukz8iO+PbAd2EyNB1cDTN91bph/05aikFH7W/nbHZvFG3vvKOT+uJIN0oWkip/BYLRPw6IFDnvNQj3Xjmv3BYjOTVrzqmlv2WI/BOYRx2guYKvslc0Sq+5QRJTmxPF00+VqFELTEShATALwD6OX2enuz1WtPxvhbZhr1gMadKxZ4gf824dPzc5swzxKzOVGGzBUH0AWeXxu4Zv3KG/5NTlt7yey7obf956dfFNLqM5I/pd2+/RIitPQSKQ1ebkEDlm9zDaBk0zYnQITfFSqe7+bypq4nXdQ2DD3qPpQ+Wd0zj+y6rWEip6R2YSM4Vwsck5Y0OoOfzJCU9Pj6DVN+ghzZu/rsn0w=="
}

variable "ssh-label" {
  default = "ssh_key_openshift"
}

variable "vm-domain" {
  default = "ibm.com"
}

