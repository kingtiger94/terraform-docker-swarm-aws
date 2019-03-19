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

output "subnet_cidr_blocks" {
  description = "This is a list of the subnet CIDR blocks that are generated by this module.  These are used when creating new security groups that would use the CIDR blocks as the ingress sources.  These include both worker and manager subnets."
  value       = "${concat(aws_subnet.managers.*.cidr_block, aws_subnet.workers.*.cidr_block)}"
}

output "subnet_count" {
  description = "This is a number of the subnet generated by this module.  These include both worker and manager subnets."
  value       = "${length(concat(aws_subnet.managers.*.id, aws_subnet.workers.*.id))}"
}

output "worker_subnets" {
  description = "This is a list of the subnet IDs that are generated by this module for workers.  This guarantees that the subnets are in different AZs."
  value       = "${aws_subnet.workers.*.id}"
}

output "iam_role" {
  description = "This is the IAM role that is generated during provisioning.  This can be used to add additional access to AWS resources from the EC2 instances."
  value       = "${aws_iam_role.ec2.name}"
}

output "daemon_cert_request_pems" {
  description = "These are TLS certificate request PEMs that need to be signed by a CA outside the module."
  value       = "${tls_cert_request.daemons.*.cert_request_pem}"
}
