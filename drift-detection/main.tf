locals {
  drift_detected = var.current_ami_id != var.approved_ami_id

  drift_status = local.drift_detected ? "DRIFT DETECTED - instance AMI does not match approved image. Repave required." : "No drift detected - instance is running the approved image"
}