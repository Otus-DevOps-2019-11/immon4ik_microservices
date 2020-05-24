output "step_01_gcloud_connect_command" {
  value = "gcloud container clusters get-credentials ${var.project_id}-gke --zone ${var.zone}"
}

output "step_02_deploy_the_k8s_dashboard_command" {
  value = "kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta8/aio/deploy/recommended.yaml"
}

output "step_03_create_a_ClusterRoleBinding_command" {
  value = "kubectl apply -f https://raw.githubusercontent.com/hashicorp/learn-terraform-provision-eks-cluster/master/kubernetes-dashboard-admin.rbac.yaml"
}

output "step_04_generate_the_authorization_token_command" {
  value = "kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep service-controller-token | awk '{print $1}')"
}

output "step_05_create_a_proxy_server_command" {
  value = "kubectl proxy --address 0.0.0.0 --accept-hosts '.*'"
}

output "step_05_k8s_dashboard_link" {
  value = "http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/"
}
