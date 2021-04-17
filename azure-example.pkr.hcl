source "azure-arm" "basic-example" {
  client_id             = "#"
  subscription_id       = "#"
  tenant_id             = "#" 
  client_secret         = "#" 

  managed_image_resource_group_name = "learning-azure"
  managed_image_name = "mattia-image"
  vm_size                 = "Standard_B1ls"
  
  location          = "East US"

  os_type           = "Linux"
  image_publisher   = "RedHat"
  image_offer       = "RHEL"
  image_sku         = "7-LVM"
}

build {
  sources = ["sources.azure-arm.basic-example"]

  provisioner "file" {
    source = "test.txt"
    destination = "/tmp/"
  }

}