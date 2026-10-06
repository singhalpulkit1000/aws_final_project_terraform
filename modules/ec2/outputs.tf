output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.app_server.id
}

output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}

output "public_dns" {
  description = "Public DNS of the EC2 instance"
  value       = aws_instance.app_server.public_dns
}

output "ami_id" {
  description = "Ubuntu AMI used for the instance"
  value       = data.aws_ami.ubuntu.id
}

output "ssh_command" {
  description = "Command to SSH into the instance"
  value       = "ssh -i ${local_sensitive_file.private_key_pem.filename} ubuntu@${aws_instance.app_server.public_ip}"
}
