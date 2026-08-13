resource "aws_backup_report_plan" "backup_report_plans" {
  for_each = var.backup_report_plans

  name        = each.value.name
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  report_delivery_channel {
    formats        = each.value.report_delivery_channel.formats
    s3_bucket_name = each.value.report_delivery_channel.s3_bucket_name
    s3_key_prefix  = each.value.report_delivery_channel.s3_key_prefix
  }

  report_setting {
    accounts             = each.value.report_setting.accounts
    framework_arns       = each.value.report_setting.framework_arns
    number_of_frameworks = each.value.report_setting.number_of_frameworks
    organization_units   = each.value.report_setting.organization_units
    regions              = each.value.report_setting.regions
    report_template      = each.value.report_setting.report_template
  }
}

