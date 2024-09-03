variable "registrys" {
  type = map(object({
    name                 = string
    image_tag_mutability = string
    image_scan_on_push   = bool

    lifecycle_policy = object({
      rules = list(object({
        rulePriority = number
        description  = string
        selection = object({
          tagStatus   = string
          countType   = string
          countNumber = number
          countUnit   = string
        })
        action = object({
          type = string
        })
      }))
    })

    tags = map(string)
  }))
}
