resource "aws_elasticsearch_domain" "this" {
  domain_name           = var.domain_name
  access_policies       = var.access_policies
  advanced_options      = var.advanced_options
  elasticsearch_version = var.elasticsearch_version
  tags                  = var.tags

  dynamic "advanced_security_options" {
    for_each = var.advanced_security_options

    content {
      enabled                        = each.value.enabled
      internal_user_database_enabled = lookup(each.value, "internal_user_database_enabled", false)

      dynamic "master_user_options" {
        for_each = lookup(advanced_security_options.value, "master_user_options", {})

        content {
          master_user_arn      = lookup(master_user_options.value, "master_user_arn", null)
          master_user_name     = lookup(master_user_options.value, "master_user_name", null)
          master_user_password = lookup(master_user_options.value, "master_user_password", null)
        }
      }
    }
  }

  dynamic "auto_tune_options" {
    for_each = var.auto_tune_options

    content {
      desired_state       = each.value.desired_state
      rollback_on_disable = lookup(each.value, "rollback_on_disable", null)

      dynamic "maintenance_schedule" {
        for_each = lookup(auto_tune_options.value, "maintenance_schedule", {})

        content {
          start_at                       = maintenance_schedule.value.start_at
          cron_expression_for_recurrence = maintenance_schedule.value.cron_expression_for_recurrence
          duration {
            value = maintenance_schedule.value.duration.value
            unit  = maintenance_schedule.value.duration.unit
          }
        }
      }
    }
  }

  dynamic "cluster_config" {
    for_each = var.cluster_config

    content {
      dedicated_master_count   = lookup(each.value, "dedicated_master_count", null)
      dedicated_master_enabled = lookup(each.value, "dedicated_master_enabled", null)
      dedicated_master_type    = lookup(each.value, "dedicated_master_type", null)
      instance_count           = lookup(each.value, "instance_count", null)
      instance_type            = lookup(each.value, "instance_type", null)
      warm_count               = lookup(each.value, "warm_count", null)
      warm_enabled             = lookup(each.value, "warm_enabled", null)
      warm_type                = lookup(each.value, "warm_type", null)
      zone_awareness_enabled   = lookup(each.value, "zone_awareness_enabled", null)

      dynamic "cold_storage_options" {
        for_each = lookup(cluster_config.value, "cold_storage_options", {})

        content {
          enabled = lookup(cold_storage_options.value, "enabled", false)
        }
      }

      dynamic "zone_awareness_config" {
        for_each = lookup(cluster_config.value, "zone_awareness_config", {})

        content {
          availability_zone_count = lookup(zone_awareness_config.value, "availability_zone_count", 2)
        }
      }

    }
  }

  dynamic "cognito_options" {
    for_each = var.cognito_options

    content {
      identity_pool_id = each.value.identity_pool_id
      role_arn         = each.value.role_arn
      user_pool_id     = each.value.user_pool_id
      enabled          = lookup(each.value, "enabled", false)
    }
  }

  dynamic "domain_endpoint_options" {
    for_each = var.domain_endpoint_options

    content {
      custom_endpoint_certificate_arn = lookup(each.value, "custom_endpoint_certificate_arn", null)
      custom_endpoint_enabled         = lookup(each.value, "custom_endpoint_enabled", null)
      custom_endpoint                 = lookup(each.value, "custom_endpoint", null)
      enforce_https                   = lookup(each.value, "enforce_https", true)
      tls_security_policy             = lookup(each.value, "tls_security_policy", null)
    }
  }

  dynamic "ebs_options" {
    for_each = var.ebs_options

    content {
      ebs_enabled = each.value.ebs_enabled
      iops        = lookup(each.value, "iops", null)
      volume_size = lookup(each.value, "volume_size", null)
      volume_type = lookup(each.value, "volume_type", null)
    }
  }

  dynamic "encrypt_at_rest" {
    for_each = var.encrypt_at_rest

    content {
      enabled    = each.value.enabled
      kms_key_id = lookup(each.value, "kms_key_id", null)
    }
  }

  dynamic "log_publishing_options" {
    for_each = var.log_publishing_options

    content {
      cloudwatch_log_group_arn = each.value.cloudwatch_log_group_arn
      log_type                 = each.value.log_type
      enabled                  = lookup(each.value, "enabled", true)
    }
  }

  dynamic "node_to_node_encryption" {
    for_each = var.node_to_node_encryption

    content {
      enabled = each.value.enabled
    }
  }

  dynamic "snapshot_options" {
    for_each = var.snapshot_options

    content {
      automated_snapshot_start_hour = each.value.automated_snapshot_start_hour
    }
  }

  dynamic "vpc_options" {
    for_each = var.vpc_options

    content {
      subnet_ids         = each.value.subnet_ids
      security_group_ids = lookup(each.value, "security_group_ids", null)
    }
  }
}
