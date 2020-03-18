variable "resource_group_name" {
  description = "Name of the resource group to place Cosmos account in."
}
variable "resource_group_location" {
  description = "Location of the resource group to place Cosmos account in."
}

variable "cosmosdb_account_name" {
  description = "(Required) Specifies the name of the Cosmos DB. Changing this forces a new resource to be created."
}
variable "offer_type" {
  description = "(Required) Specifies the Offer Type to use for this CosmosDB Account - currently this can only be set to Standard"
  #offer_type  = "Standard"
}
variable "kind" {
  description = "(Optional) Specifies the Kind of CosmosDB to create - possible values are GlobalDocumentDB and MongoDB. Defaults to GlobalDocumentDB. Changing this forces a new resource to be created."
}

variable "enable_automatic_failover" {
  type        = bool
  description = "(Optional) Enable automatic fail over for this Cosmos DB account"
}

variable "geo_locations" {
  description = "Configures the geographic locations the data is replicated to and supports the following: location, failover_priority "
  type = list(object({
  location                   = string
  failover_priority          = number
}))
default = []
}

variable "consistency_level" {
  type        = string
  description = "(Required) The Consistency Level to use for this CosmosDB Account - can be either BoundedStaleness, Eventual, Session, Strong or ConsistentPrefix."
  default = "BoundedStaleness"
}

variable "max_interval_in_seconds" {
  type        = string
  description = "(Optional) Enable automatic fail over for this Cosmos DB account"
  default     = 10
}

variable "capabilities_enabled" {
  description = "Configures the capabilities to enable for this Cosmos DB account: Possible values are EnableAggregationPipeline, EnableCassandra, EnableGremlin,EnableMongo, EnableTable, MongoDBv3.4, and mongoEnableDocLevelTTL"
  type = list(object({
  name      = string
}))
  default = []
}


variable "authorized_ip_addresses_range" {
  type        = string
  description = "This value specifies the set of IP addresses or IP address ranges in CIDR form to be included as the allowed list of client IP's for a given database account. "
  default     = ""
}


variable "is_virtual_network_filter_enabled" {
  type        = bool
  description = "(Optional) Enables virtual network filtering for this Cosmos DB "
  default     = false
}

#
variable "virtual_network_rules" {
  description = "The virtual network subnets allowed to access this Cosmos DB account"
  type = list(object({
  subnet_id                 = string
}))
  default = []
}

variable "mongo_db_names" {
  type        = list(string)
  description = "a list of mongodb names"
  default     = []
}
