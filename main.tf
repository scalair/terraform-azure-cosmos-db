# since these variables are re-used - a locals block makes this more maintainable
provider "azurerm" {
  features {}
}

resource "azurerm_cosmosdb_account" "cosmosdb_account" {
  name                = var.cosmosdb_account_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  offer_type          = var.offer_type
  kind                = var.kind

  enable_automatic_failover = var.enable_automatic_failover

  consistency_policy {
    consistency_level       = var.consistency_level
    max_interval_in_seconds = var.max_interval_in_seconds
  }

  dynamic geo_location {
    for_each = var.geo_locations
    content {
      location          = geo_location.value.location
      failover_priority = geo_location.value.failover_priority
    }
  }
  dynamic capabilities {
    for_each = var.capabilities_enabled
    content {
      name          = capabilities.value.name
    }
  }

  ip_range_filter =  var.authorized_ip_addresses_range
  is_virtual_network_filter_enabled = var.is_virtual_network_filter_enabled

  #
  dynamic virtual_network_rule {
  for_each = var.virtual_network_rules
    content {
      id          = virtual_network_rule.value.subnet_id
    }
  }
}

resource "azurerm_cosmosdb_mongo_database" "mongo_db" {
  for_each = toset(var.mongo_db_names)
    name                = each.value
    resource_group_name = var.resource_group_name
    account_name        = azurerm_cosmosdb_account.cosmosdb_account.name
}