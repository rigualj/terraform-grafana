//Create escalation chain 
resource "grafana_oncall_escalation_chain" "default" {
  name = "SRE US"
}

data "grafana_oncall_user" "rigualj" {
  username = "rigualj"
}

// Notify step
resource "grafana_oncall_escalation" "example_notify_step0" {
  escalation_chain_id = grafana_oncall_escalation_chain.default.id
  type                = "notify_persons"
  persons_to_notify = [
    data.grafana_oncall_user.rigualj.id
  ]
  position = 0
}


// Wait step
resource "grafana_oncall_escalation" "example_notify_step1" {
  escalation_chain_id = grafana_oncall_escalation_chain.default.id
  type                = "wait"
  duration            = 300
  position            = 1
}


// Notify step
resource "grafana_oncall_escalation" "example_notify_step2" {
  escalation_chain_id = grafana_oncall_escalation_chain.default.id
  type                = "notify_persons"
  persons_to_notify = [
    data.grafana_oncall_user.rigualj.id
  ]
  position = 2
}


// Wait step
resource "grafana_oncall_escalation" "example_notify_step3" {
  escalation_chain_id = grafana_oncall_escalation_chain.default.id
  type                = "wait"
  duration            = 300
  position            = 3
}


// Notify step
resource "grafana_oncall_escalation" "example_notify_step4" {
  escalation_chain_id = grafana_oncall_escalation_chain.default.id
  type                = "notify_persons"
  persons_to_notify = [
    data.grafana_oncall_user.rigualj.id
  ]
  position = 4
}


// Wait step
resource "grafana_oncall_escalation" "example_notify_step5" {
  escalation_chain_id = grafana_oncall_escalation_chain.default.id
  type                = "wait"
  duration            = 300
  position            = 5
}


# // Create escalation chain 
# // Trigger fake webhook
# resource "grafana_oncall_escalation" "step0" {
#   provider = grafana
#   position            = 0
#   escalation_chain_id = grafana_oncall_escalation_chain.sre_us.id
#   type                = "trigger_webhook"
#   action_to_trigger   = data.grafana_oncall_outgoing_webhook.Restart.id
# }

# //Create escalation chain 
# // Wait 
# resource "grafana_oncall_escalation" "example_notify_step1" {
#   provider = grafana
#   escalation_chain_id = grafana_oncall_escalation_chain.frontend_critical.id
#   type                = "wait"
#   duration            = 300
#   position            = 2
# }

# //Create escalation chain 
# // Notify Primary on call
# resource "grafana_oncall_escalation" "example_notify_step2" {
#   provider = grafana
#   escalation_chain_id = grafana_oncall_escalation_chain.frontend_critical.id
#   type                = "notify_on_call_from_schedule"
#   notify_on_call_from_schedule = grafana_oncall_schedule.frontend_primary_schedule.id 
#   position            = 1
# }



# //Create escalation chain 
# // notify management 
# resource "grafana_oncall_escalation" "example_notify_step4" {
#   provider = grafana
#   escalation_chain_id = grafana_oncall_escalation_chain.frontend_critical.id
#   type                = "notify_on_call_from_schedule"
#   notify_on_call_from_schedule = grafana_oncall_schedule.frontend_manager_fallback_schedule.id
#   position            = 3
# }


# // Create escalation chain 
# // Trigger fake webhook
# resource "grafana_oncall_escalation" "step" {
#   provider = grafana
#   position            = 0
#   escalation_chain_id = grafana_oncall_escalation_chain.frontend.id
#   type                = "trigger_webhook"
#   action_to_trigger   = data.grafana_oncall_outgoing_webhook.GithubActions.id
# }

# //Create escalation chain 
# // Wait 
# resource "grafana_oncall_escalation" "example_notify_step" {
#   provider = grafana
#   escalation_chain_id = grafana_oncall_escalation_chain.frontend.id
#   type                = "wait"
#   duration            = 300
#   position            = 2
# }

# //Create escalation chain 
# // Notify Primary on call
# resource "grafana_oncall_escalation" "example_notify_step5" {
#   provider = grafana
#   escalation_chain_id = grafana_oncall_escalation_chain.frontend.id
#   type                = "notify_on_call_from_schedule"
#   notify_on_call_from_schedule = grafana_oncall_schedule.frontend_primary_schedule.id 
#   position            = 1
# }
