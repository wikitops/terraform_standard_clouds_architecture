output "sns_topic_id" {
  value = "${aws_sns_topic.this.*.id}"
}
