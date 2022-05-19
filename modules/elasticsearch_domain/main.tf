resource "aws_elasticsearch_domain" "this" {
  domain_name           = var.domain_name
  access_policies       = var.access_policies
  advanced_options      = var.advanced_options
  elasticsearch_version = var.elasticsearch_version
  tags                  = var.tags

  dynamic "advanced_security_options" {
    for_each = var.advanced_security_options != {} ? [var.advanced_security_options] : []

    content {
      enabled                        = advanced_security_options.value["enabled"]
      internal_user_database_enabled = try(advanced_security_options.value["internal_user_database_enabled"], false)

      dynamic "master_user_options" {
        for_each = try(advanced_security_options.value["master_user_options"], {}) != {} ? [advanced_security_options.value["master_user_options"]] : []

        content {
          master_user_arn      = try(master_user_options.value["master_user_arn"], null)
          master_user_name     = try(master_user_options.value["master_user_name"], null)
          master_user_password = try(master_user_options.value["master_user_password"], null)
        }
      }
    }
  }

  dynamic "auto_tune_options" {
    for_each = var.auto_tune_options != {} ? [var.auto_tune_options] : []

    content {
      desired_state       = auto_tune_options.value["desired_state"]
      rollback_on_disable = try(auto_tune_options.value["rollback_on_disable"], null)

      dynamic "maintenance_schedule" {
        for_each = try(auto_tune_options.value["maintenance_schedule"], {}) != {} ? [auto_tune_options.value["maintenance_schedule"]] : []

        content {
          start_at                       = maintenance_schedule.value["start_at"]
          cron_expression_for_recurrence = maintenance_schedule.value["cron_expression_for_recurrence"]

          dynamic "duration" {
            for_each = [maintenance_schedule.value["duration"]]

            content {
              value = duration.value["value"]
              unit  = duration.value["unit"]
            }
          }
        }
      }
    }
  }

  dynamic "cluster_config" {
    for_each = var.cluster_config != {} ? [var.cluster_config] : []

    content {
      dedicated_master_count   = try(cluster_config.value["dedicated_master_count"], null)
      dedicated_master_enabled = try(cluster_config.value["dedicated_master_enabled"], null)
      dedicated_master_type    = try(cluster_config.value["dedicated_master_type"], null)
      instance_count           = try(cluster_config.value["instance_count"], null)
      instance_type            = try(cluster_config.value["instance_type"], null)
      warm_count               = try(cluster_config.value["warm_count"], null)
      warm_enabled             = try(cluster_config.value["warm_enabled"], null)
      warm_type                = try(cluster_config.value["warm_type"], null)
      zone_awareness_enabled   = try(cluster_config.value["zone_awareness_enabled"], null)

      dynamic "cold_storage_options" {
        for_each = try(cluster_config.value["cold_storage_options"], {}) != {} ? [cluster_config.value["cold_storage_options"]] : []

        content {
          enabled = try(cold_storage_options.value["enabled"], false)
        }
      }

      dynamic "zone_awareness_config" {
        for_each = try(cluster_config.value["zone_awareness_config"], {}) != {} ? [cluster_config.value["zone_awareness_config"]] : []

        content {
          availability_zone_count = try(zone_awareness_config.value["availability_zone_count"], 2)
        }
      }

    }
  }

  dynamic "cognito_options" {
    for_each = var.cognito_options != {} ? [var.cognito_options] : []

    content {
      identity_pool_id = cognito_options.value["identity_pool_id"]
      role_arn         = cognito_options.value["role_arn"]
      user_pool_id     = cognito_options.value["user_pool_id"]
      enabled          = try(cognito_options.value["enabled"], false)
    }
  }

  dynamic "domain_endpoint_options" {
    for_each = var.domain_endpoint_options != {} ? [var.domain_endpoint_options] : []

    content {
      custom_endpoint_certificate_arn = try(domain_endpoint_options.value["custom_endpoint_certificate_arn"], null)
      custom_endpoint_enabled         = try(domain_endpoint_options.value["custom_endpoint_enabled"], null)
      custom_endpoint                 = try(domain_endpoint_options.value["custom_endpoint"], null)
      enforce_https                   = try(domain_endpoint_options.value["enforce_https"], true)
      tls_security_policy             = try(domain_endpoint_options.value["tls_security_policy"], null)
    }
  }

  dynamic "ebs_options" {
    for_each = var.ebs_options != {} ? [var.ebs_options] : []

    content {
      ebs_enabled = ebs_options.value["ebs_enabled"]
      iops        = try(ebs_options.value["iops"], null)
      volume_size = try(ebs_options.value["volume_size"], null)
      volume_type = try(ebs_options.value["volume_type"], null)
    }
  }

  dynamic "encrypt_at_rest" {
    for_each = var.encrypt_at_rest != {} ? [var.encrypt_at_rest] : []

    content {
      enabled    = encrypt_at_rest.value["enabled"]
      kms_key_id = try(encrypt_at_rest.value["kms_key_id"], null)
    }
  }

  dynamic "log_publishing_options" {
    for_each = var.log_publishing_options #!= {} ? [var.log_publishing_options] : []

    content {
      log_type                 = log_publishing_options.key
      cloudwatch_log_group_arn = log_publishing_options.value["cloudwatch_log_group_arn"]
      enabled                  = try(log_publishing_options.value["enabled"], true)
    }
  }

  dynamic "node_to_node_encryption" {
    for_each = var.node_to_node_encryption != {} ? [var.node_to_node_encryption] : []

    content {
      enabled = node_to_node_encryption.value["enabled"]
    }
  }

  dynamic "snapshot_options" {
    for_each = var.snapshot_options != {} ? [var.snapshot_options] : []

    content {
      automated_snapshot_start_hour = snapshot_options.value["automated_snapshot_start_hour"]
    }
  }

  dynamic "vpc_options" {
    for_each = var.vpc_options != {} ? [var.vpc_options] : []

    content {
      subnet_ids         = vpc_options.value["subnet_ids"]
      security_group_ids = try(vpc_options.value["security_group_ids"], null)
    }
  }
}
