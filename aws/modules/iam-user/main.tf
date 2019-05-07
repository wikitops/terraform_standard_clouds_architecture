resource "aws_iam_user" "this" {
  name                        = "${var.name}"
  path                        = "${var.path}"
  force_destroy               = "${var.force_destroy}"
}

# resource "aws_iam_user_login_profile" "this" {
#   user                        = "${aws_iam_user.this.name}"
#   pgp_key                     = "${var.pgp_key}"
#   password_length             = "${var.password_length}"
#   password_reset_required     = "${var.password_reset_required}"
# }

resource "aws_iam_access_key" "this" {
  user                        = "${aws_iam_user.this.name}"
  # pgp_key                     = "${var.pgp_key}"
}

data "aws_iam_policy_document" "this" {
  statement {
    effect                    = "${var.policy_effect}"

    actions                   = "${var.policy_actions}"

    resources                 = "${var.policy_resources}"
  }
}

resource "aws_iam_user_policy" "this" {
  name                        = "${var.policy_name}"
  user                        = "${aws_iam_user.this.name}"

  policy                      = "${data.aws_iam_policy_document.this.json}"
}
