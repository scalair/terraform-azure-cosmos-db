# terraform-azure-cosmos-db

Terraform module which creates Cosmos account, adds firewall and security rules, and Mongo databases 

Terragrunt instance example is provided below:

```hcl
inputs = {
  cosmosdb_account_name     = "account name"
  resource_group_name       = "RG name"
  resource_group_location   = "region name"
  kind                      = "MongoDB"
  enable_automatic_failover = false
  offer_type  = "Standard"
  geo_locations = [
    {
      location          = "azure region",
      failover_priority = 0
    }
  ]

  authorized_ip_addresses_range     = "ip1,ip2"
  is_virtual_network_filter_enabled = true

  virtual_network_rules             = []

  mongo_db_names                    = ["",""]

  #capabilities_enabled = [
  #  {
  #    name          = "EnableMongo", #MongoDBv3.4
  #  }
  #]

}
```

