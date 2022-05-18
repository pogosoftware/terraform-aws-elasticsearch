resource "aws_elasticsearch_domain" "this" {
  domain_name           = var.domain_name
  access_policies       = var.access_policies
  advanced_options      = var.advanced_options
  elasticsearch_version = var.elasticsearch_version
  tags                  = var.tags

  dynamic "advanced_security_options" {
    for_each = var.advanced_security_options

    content {
      enabled                        = advanced_security_options.value.enabled
      internal_user_database_enabled = lookup(advanced_security_options.value, "internal_user_database_enabled", false)

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
      desired_state       = auto_tune_options.value.desired_state
      rollback_on_disable = lookup(auto_tune_options.value, "rollback_on_disable", null)

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
      dedicated_master_count   = lookup(cluster_config.value, "dedicated_master_count", null)
      dedicated_master_enabled = lookup(cluster_config.value, "dedicated_master_enabled", null)
      dedicated_master_type    = lookup(cluster_config.value, "dedicated_master_type", null)
      instance_count           = lookup(cluster_config.value, "instance_count", null)
      instance_type            = lookup(cluster_config.value, "instance_type", null)
      warm_count               = lookup(cluster_config.value, "warm_count", null)
      warm_enabled             = lookup(cluster_config.value, "warm_enabled", null)
      warm_type                = lookup(cluster_config.value, "warm_type", null)
      zone_awareness_enabled   = lookup(cluster_config.value, "zone_awareness_enabled", null)

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
      identity_pool_id = cognito_options.value.identity_pool_id
      role_arn         = cognito_options.value.role_arn
      user_pool_id     = cognito_options.value.user_pool_id
      enabled          = lookup(cognito_options.value, "enabled", false)
    }
  }

  dynamic "domain_endpoint_options" {
    for_each = var.domain_endpoint_options

    content {
      custom_endpoint_certificate_arn = lookup(domain_endpoint_options.value, "custom_endpoint_certificate_arn", null)
      custom_endpoint_enabled         = lookup(domain_endpoint_options.value, "custom_endpoint_enabled", null)
      custom_endpoint                 = lookup(domain_endpoint_options.value, "custom_endpoint", null)
      enforce_https                   = lookup(domain_endpoint_options.value, "enforce_https", true)
      tls_security_policy             = lookup(domain_endpoint_options.value, "tls_security_policy", null)
    }
  }

  dynamic "ebs_options" {
    for_each = var.ebs_options

    content {
      ebs_enabled = ebs_options.value.ebs_enabled
      iops        = lookup(ebs_options.value, "iops", null)
      volume_size = lookup(ebs_options.value, "volume_size", null)
      volume_type = lookup(ebs_options.value, "volume_type", null)
    }
  }

  dynamic "encrypt_at_rest" {
    for_each = var.encrypt_at_rest

    content {
      enabled    = encrypt_at_rest.value.enabled
      kms_key_id = lookup(encrypt_at_rest.value, "kms_key_id", null)
    }
  }

  dynamic "log_publishing_options" {
    for_each = var.log_publishing_options

    content {
      cloudwatch_log_group_arn = log_publishing_options.value.cloudwatch_log_group_arn
      log_type                 = log_publishing_options.value.log_type
      enabled                  = lookup(log_publishing_options.value, "enabled", true)
    }
  }

  dynamic "node_to_node_encryption" {
    for_each = var.node_to_node_encryption

    content {
      enabled = node_to_node_encryption.value.enabled
    }
  }

  dynamic "snapshot_options" {
    for_each = var.snapshot_options

    content {
      automated_snapshot_start_hour = snapshot_options.value.automated_snapshot_start_hour
    }
  }

  dynamic "vpc_options" {
    for_each = var.vpc_options

    content {
      subnet_ids         = vpc_options.value.subnet_ids
      security_group_ids = lookup(vpc_options.value, "security_group_ids", null)
    }
  }
}
