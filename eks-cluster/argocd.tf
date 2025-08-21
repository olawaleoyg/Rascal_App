# resource "kubernetes_namespace" "argocd" {
#   metadata {
#     annotations = {
#       name = "argocd"
#     }
#     name = "argocd"
#   }
#   depends_on = [
#     module.eks,
#     module.prod_eks_managed_node_group,
#     module.staging_eks_managed_node_group,
#     module.tooling_eks_managed_node_group
#   ]
# }



# data "kubectl_file_documents" "argocd" {
#   content = file("deployment/argocd-install.yaml")
# }

# resource "kubectl_manifest" "argocd" {
#   for_each  = data.kubectl_file_documents.argocd.manifests
#   yaml_body = replace(each.value, "\nmetadata:", "\nmetadata:\n  namespace: argocd")

#   depends_on = [
#     module.eks,
#     module.prod_eks_managed_node_group,
#     module.staging_eks_managed_node_group,
#     module.tooling_eks_managed_node_group,
#     kubernetes_namespace.argocd
#   ]
# }
