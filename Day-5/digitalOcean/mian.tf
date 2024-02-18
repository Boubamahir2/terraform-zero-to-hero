terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

# here you can your computer ssh public key
# resource "digitalocean_ssh_key" "terraform-key" {
#   name = "terraform-demo-key" # Replace with your desired key name
#   public_key = file("~/.ssh/id_rsa.pub") # Replace with the path to your public key file
# }

# Create a new Web Droplet in the nyc2 region
# Settings > Security section.Locate the SSH key you want to use and copy its fingerprint. add the fingerprint to the ssh_keys argument like this:
# resource "digitalocean_droplet" "demo_droplet" {
#   image    = "ubuntu-20-04-x64"
#   name     = "web-1"
#   region   = "fra1"
#   size     = "s-1vcpu-1gb"
#   ssh_keys = ["4c:46:2f:29:ac:cb:32:60:29:64:e7:86:19:1f:e1:b3"]
# }

resource "digitalocean_droplet" "demo_droplet" {
  image    = "ubuntu-20-04-x64"
  name     = "web-1"
  region   = "fra1"
  size     = "s-1vcpu-1gb"
  ssh_keys = ["e1:60:18:52:09:28:79:41:f7:06:ab:e1:0f:45:67:4f"]

  connection {
    host = self.ipv4_address
    user = "root"  # Replace with your username
    type = "ssh"
    private_key = file("~/.ssh/id_rsa")  # Securely store key
    # host = digitalocean_droplet.demo_droplet.ipv4_address
    timeout = "2m"
  }

  # File provisioner to copy a file from local to the remote EC2 instance
  provisioner "file" {
    source      = "app.py"  # Replace with the path to your local file
    destination = "/home/ubuntu/app.py"  # Replace with the path on the remote instance
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Hello from the remote instance'",
      "sudo apt update -y",  # Update package lists (for ubuntu)
      "sudo apt-get install -y python3-pip",  # Example package installation
      "cd /home",
      "sudo pip3 install flask",
      "sudo python3 app.py &",
    ]
  }
}

# output "public_ip" {
#   value = digitalocean_droplet.demo_droplet.ipv4_address
# }