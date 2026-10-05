# Generate an ED25519 key pair locally
resource "tls_private_key" "ec2_key" {
  algorithm = "ED25519"
}

# Register the public key with AWS
resource "aws_key_pair" "ec2_key" {
  key_name   = "${var.project_name}-key"
  public_key = tls_private_key.ec2_key.public_key_openssh
}

# Save the private key as a .pem file in this folder for SSH access
resource "local_sensitive_file" "private_key_pem" {
  content         = tls_private_key.ec2_key.private_key_openssh
  filename        = "${path.module}/${var.project_name}-key.pem"
  file_permission = "0400"
}
