#Admin
output "iam_arn" {
  description = "ARN of IAM role"
  value       = "${aws_iam_role.this.arn}"
}

output "iam_id" {
  description = "Id of IAM role"
  value       = "${aws_iam_role.this.unique_id}"
}

output "iam_name" {
  description = "Name of IAM role"
  value       = "${aws_iam_role.this.name}"
}

output "iam_instance_profile_id" {
  description = "The instance profile's ID."
  value       = "${aws_iam_instance_profile.this.id}"
}

output "iam_instance_profile_name" {
  description = "The instance profile's name."
  value       = "${aws_iam_instance_profile.this.name}"
}
