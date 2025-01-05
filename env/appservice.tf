resource "azurerm_app_service" "appservice" {
    name                = "webapp"
    location            = local.shared.location
    resource_group_name = local.shared.rg_name
    app_service_plan_id = var.app_service_plan_id
    os_type = "linux"
    sku_name = "B1"
    tags = local.shared.tags
    depends_on = [
        var.app_service_plan
    ]
}

    module "app_services" {
        source = "app.terraform.io/lockton/apps/azurerm"
        version = "1.0.0"
        for_each = {
            for service in local.app_services : service.name => service}

       allowed_ip_address = []
       app_service_plan_id = azurerm_app_service.appservice.app_service_plan_id
       log_analytics_workspace_id = local.shared.log_analytics_workspace_id
       os_type = "linux"
       private_endpoint_subnet_id = local.network.subnets.private_endpoint_subnet_id
       rg_name = local.shared.rg_name
       tags= lacla.shared.tags
       vnet_integration_subnet_id = local.network.subnets.vnet_integration_subnet_id
       web_app_name = each.value.name
       webapp_pe_dnszone = local.network.dns_zones.webapp_pe_dnszone
       webapp_pe_dnszoneid = [local.network.dns_zones.webapp_pe_dnszoneid]
       location = local.shared.location
       public_network_access_enabled= true
       https_only = true
       app_settings = {
        Environment = "dev"
        keyvault = module.keyvault.keyvault_id
        scm_command_idle_timeout = "00:01:00"
        scm_command_timeout = "00:01:00"
        webjobs_command_timeout = "00:01:00"
        website_enable_sync_update_site = "true"
        website_run_from_package = "1"
        }

        site_config = {
        always_on = "true"
        use_32bit_worker_process = "false"
        vnet_route_all_enabled = "true"
        }
        depends_on = [module.snet_appservice]


    }