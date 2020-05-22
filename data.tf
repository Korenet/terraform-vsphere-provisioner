data "vsphere_datacenter" "dc" {
  name              = var.vsphere_datacenter
}

data "vsphere_host" "host" {
  count             = (var.vsphere_host != null ? 1 : 0 )
  name              = var.vsphere_host
  datacenter_id     = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  count             = (var.vsphere_cluster != null ? 1 : 0)
  name              = var.vsphere_cluster
  datacenter_id     = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore" {
  count             = (var.vsphere_datastore != null ? 1 : 0)
  name              = var.vsphere_datastore
  datacenter_id     = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore_cluster" "datastore_cluster" {
  count             = (var.vsphere_datastore_cluster  != null ? 1 : 0)
  name              = var.vsphere_datastore_cluster
  datacenter_id     = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name              = var.vsphere_network
  datacenter_id     = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name              = var.vsphere_vm_template
  datacenter_id     = data.vsphere_datacenter.dc.id
}