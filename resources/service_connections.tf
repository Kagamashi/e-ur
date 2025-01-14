resource "azurerm_user_assigned_identity" "service_connection_uai" {
  name                = local.uai_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
}

resource "azuredevops_serviceendpoint_azurerm" "service_connection" {
  project_id                             = data.azuredevops_project.project.id
  service_endpoint_name                  = local.service_endpoint_name
  service_endpoint_authentication_scheme = "WorkloadIdentityFederation"
  credentials {
    serviceprincipalid = azurerm_user_assigned_identity.service_connection_uai.client_id
  }
  azurerm_subscription_id   = data.azurerm_subscription.current.subscription_id
  azurerm_subscription_name = data.azurerm_subscription.current.display_name
  azurerm_spn_tenantid      = data.azurerm_subscription.current.tenant_id
}

resource "azurerm_federated_identity_credential" "ado_service_connwection" {
  name                = local.federation_name
  resource_group_name = azurerm_resource_group.rg.name
  parent_id           = azurerm_user_assigned_identity.service_connection_uai.id

  audience = ["api://AzureADTokenExchange"]
  issuer   = azuredevops_serviceendpoint_azurerm.service_connection.workload_identity_federation_issuer
  subject  = azuredevops_serviceendpoint_azurerm.service_connection.workload_identity_federation_subject
}
