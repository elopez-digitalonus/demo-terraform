resource "aws_key_pair" "ssh_master_0545" {
  key_name   = "master_0545"
  public_key = var.ssh_0545_key_pair
}


resource "aws_instance" "vault_0545" {
  ami             = var.ami
  instance_type   = var.instance_type
  security_groups = [var.sg_dmz_id]
  subnet_id       = var.subnet_dmz_id
  key_name        = aws_key_pair.ssh_master_0545.key_name
  root_block_device {
    delete_on_termination = true
    encrypted             = true
    kms_key_id            = var.kms_key_id
    volume_size           = 10
  }
  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y yum-utils",
      "sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo",
      "sudo yum -y install vault",
      "sudo systemctl start vault; sleep 30",
      "vault operator init -tls-skip-verify -address=https://localhost:8200 > unseal.txt"
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/id_rsa")
      host        = self.public_ip
    }
  }
  tags = {
    Name = "0545_vault"
  }
}
