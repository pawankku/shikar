variable "rgs" {
  description = "Map of resource groups with names and locations"
  type = map(object({
    name     = string
    location = string
  }))
}
# variable "subscription_id" {
#   description = "The subscription ID for Azure"
#   type        = string
#   default     = "7869862f-d28a-4869-ae00-17ce96a1935a"
# }