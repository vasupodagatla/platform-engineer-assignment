output "drift_detected" {
  description = "Indicates whether the running AMI differs from the approved AMI"
  value       = local.drift_detected
}

output "drift_status" {
  description = "Human-readable drift detection result"
  value       = local.drift_status
}