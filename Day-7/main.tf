provider "aws" {
  region = "us-east-1"
}

provider "vault" {
  address = "http://157.230.20.211:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "e99cc96e-9b7d-6e8a-9550-60c6500daf8d"
      secret_id = "b77468b2-1753-2c0b-ff6a-7ae1cd02aa85"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv" // change it according to your mount
  name  = "test-secret" // change it according to your secret
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"

  tags = {
    Name = "test"
    Secret = data.vault_kv_secret_v2.example.data["username"]
  }
}
