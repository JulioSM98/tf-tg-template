module "ecr" {
  source   = "terraform-aws-modules/ecr/aws"
  for_each = var.registrys

  repository_name = each.value.name
  repository_image_tag_mutability = each.value.image_tag_mutability

  repository_image_scan_on_push = each.value.image_scan_on_push
  repository_lifecycle_policy = jsonencode(each.value.lifecycle_policy)
  

  tags = each.value.tags


}
