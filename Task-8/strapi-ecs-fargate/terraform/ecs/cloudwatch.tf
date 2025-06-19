# Metric Alarms
resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "Strapi-High-CPU"
  namespace           = "AWS/ECS"
  metric_name         = "CPUUtilization"
  dimensions = {
    ClusterName = aws_ecs_cluster.strapi.name
    ServiceName = aws_ecs_service.strapi.name
  }
  statistic           = "Average"
  period              = 60
  evaluation_periods  = 2
  threshold           = 80
  comparison_operator = "GreaterThanThreshold"
  alarm_description   = "Fires if CPU > 80% for >2 mins"
}

resource "aws_cloudwatch_metric_alarm" "memory_high" {
  alarm_name          = "Strapi-High-Memory"
  namespace           = "AWS/ECS"
  metric_name         = "MemoryUtilization"
  dimensions = {
    ClusterName = aws_ecs_cluster.strapi.name
    ServiceName = aws_ecs_service.strapi.name
  }
  statistic           = "Average"
  period              = 60
  evaluation_periods  = 2
  threshold           = 80
  comparison_operator = "GreaterThanThreshold"
  alarm_description   = "Fires if Memory > 80% for >2 mins"
}

# Optional: CloudWatch Dashboard
resource "aws_cloudwatch_dashboard" "strapi_dashboard" {
  dashboard_name = "StrapiDashboard"
  dashboard_body = jsonencode({
    widgets = [
      {
        type       = "metric",
        x          = 0,
        y          = 0,
        width      = 12,
        height     = 6,
        properties = {
          metrics = [
            [ "AWS/ECS", "CPUUtilization", "ServiceName", aws_ecs_service.strapi.name ],
            [ ".", "MemoryUtilization", ".", "." ]
          ],
          period = 60,
          stat   = "Average",
          title  = "Strapi ECS CPU / Memory"
        }
      }
    ]
  })
}

