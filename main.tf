resource "google_dataproc_cluster_iam_member" "dataproc_cluster_iam_members" {
  for_each = var.dataproc_cluster_iam_members

  cluster = each.value.cluster
  member  = each.value.member
  role    = each.value.role
  project = each.value.project
  region  = each.value.region

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

