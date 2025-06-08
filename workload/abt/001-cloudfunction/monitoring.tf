resource "google_monitoring_notification_channel" "email" {
  project = var.project_id
  display_name = "Alert Email"
  type         = "email"

  labels = {
    email_address = var.email_address
  }
}

resource "google_monitoring_alert_policy" "function_error_policy" {
  display_name = "Cloud Function Error Alert"
  project = var.project_id
  combiner = "OR"
  notification_channels = [google_monitoring_notification_channel.email.id]

  conditions {
    display_name = "High error rate for Cloud Function"

    condition_threshold {
      filter = <<EOT
metric.type="cloudfunctions.googleapis.com/function/execution_count"
resource.type="cloud_function"
metric.label."status"="error"
resource.label."function_name"="${module.google_cloudfunctions2_function.name}"
EOT

      duration = "300s"
      comparison = "COMPARISON_GT"
      threshold_value = 1

      aggregations {
        alignment_period   = "300s"
        per_series_aligner = "ALIGN_RATE"
      }
    }
  }

  documentation {
    content = "Function ${module.google_cloudfunctions2_function.name} is experiencing errors."
    mime_type = "text/markdown"
  }

  enabled = true
}
