variable "rgs" {
  description = "Map of resource groups with names and locations"
  type = map(object({
    name     = string
    location = string
  }))
}
