output "vm_details" {
  description = "Details of VMs"
  value = {
    aws = {
      internal_ip = aws_instance.example_instance.private_ip
      public_ip   = aws_instance.example_instance.public_ip
      username    = "ubuntu"
      key_file    = "/home/administrator/themkeys/tyui.pub"
    }
  }
}
