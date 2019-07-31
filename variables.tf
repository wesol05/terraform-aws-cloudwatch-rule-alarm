variable "rule-name" {
  description = "Rule to set up alarm."
}
variable "sns-topic" {
  description = "Name of the topic where to send a notifications."
}
variable "enabled" {
  type = bool
  default = true
  description = "Determine if resources should be created."
}
variable "tags" {
  type = "map"
  default = {}
  description = "Tags attached to created resources."
}
variable "period" {
  default = 60
  description = "The period in seconds over which the specified statistic is applied."
}
variable "evaluation_periods" {
  default = 1
  description = "The number of periods over which data is compared to the specified threshold."
}
variable "datapoints_to_alarm" {
  default = 1
  description = "The number of datapoints that must be breaching to trigger the alarm."
}