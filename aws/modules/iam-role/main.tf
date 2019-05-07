data "aws_iam_policy_document" "this" {
  statement {
    sid                       = "${var.policy_sid}"
    effect                    = "${var.policy_effect}"

    actions                   = "${var.policy_actions}"

    principals {
      type                    = "${var.policy_type}"
      identifiers             = ["${var.policy_identifiers}"]
    }
  }
}

resource "aws_iam_role" "this" {
  name                        = "${var.role_name}"
  path                        = "${var.role_path}"
  max_session_duration        = "${var.max_session_duration}"

  assume_role_policy          = "${data.aws_iam_policy_document.this.json}"
}

resource "aws_iam_instance_profile" "this" {
  name                        = "${var.instance_profile_name}"
  role                        = "${aws_iam_role.this.name}"
}
