variable "backup_report_plans" {
  description = <<EOT
Map of backup_report_plans, attributes below
Required:
    - name
    - report_delivery_channel (block):
        - formats (optional)
        - s3_bucket_name (required)
        - s3_key_prefix (optional)
    - report_setting (block):
        - accounts (optional)
        - framework_arns (optional)
        - number_of_frameworks (optional)
        - organization_units (optional)
        - regions (optional)
        - report_template (required)
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name        = string
    description = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
    report_delivery_channel = object({
      formats        = optional(set(string))
      s3_bucket_name = string
      s3_key_prefix  = optional(string)
    })
    report_setting = object({
      accounts             = optional(set(string))
      framework_arns       = optional(set(string))
      number_of_frameworks = optional(number)
      organization_units   = optional(set(string))
      regions              = optional(set(string))
      report_template      = string
    })
  }))
  # Note: 4 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

