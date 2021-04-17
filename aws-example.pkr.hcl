locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "amazon-ebs" "example" {
  access_key                    = "#"
  secret_key                    = "#"
  token                         = "#"
  region                        = "us-east-1"
  source_ami                    = "ami-096fda3c22c1c990a" # redhat linux
  ssh_username                  = "ec2-user"
  instance_type                 = "t2.micro"
  ami_name                      = "packer example ${local.timestamp}"
}

build {
  sources = ["source.amazon-ebs.example"]

  provisioner "file" {
    source        = "myscript.sh"
    destination   = "/tmp/myscript.sh"
  }

}