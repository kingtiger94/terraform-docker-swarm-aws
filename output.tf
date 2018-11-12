output "manager_instance_ids" {
  description = "This is a list of the AWS instance IDs for the managers."
  value       = "${aws_instance.managers.*.id}"
}

output "worker_instance_ids" {
  description = "This is a list of the AWS instance IDs for the workers."
  value       = "${aws_instance.workers.*.id}"
}

output "manager_ips" {
  description = "This is a list of the AWS instance public IPs for the managers."
  value       = "${aws_instance.managers.*.public_ip}"
}

output "worker_ips" {
  description = "This is a list of the AWS instance public IPs for the workers."
  value       = "${aws_instance.workers.*.public_ip}"
}

output "subnets" {
  description = "This is a list of the subnet IDs that are generated by this module.  These include both worker and manager subnets."
  value       = "${concat(aws_subnet.managers.*.id, aws_subnet.workers.*.id)}"
}
