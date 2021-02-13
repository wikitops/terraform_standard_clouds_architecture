module "private_route53_zone" {
  source  = "terraform-aws-modules/route53/aws//modules/zones"
  version = "1.6.0"

  zones = {
    "internal-wikitops.io" = {
      comment = "Internal Wikitops domain (lab)"
      tags = {
        Owner         = "wikitops"
        Environment   = "lab"
        ProvisionedBy = "terraform"
      }
    }
  }

}
