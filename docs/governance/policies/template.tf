# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/policy_definition

# The effect parameter determines the behavior of the policy:
#   audit: Allows the resource to be created but flags it as non-compliant in Azure Policy.
#   deny: Prevents the creation or update of non-compliant resources.
#   disabled: Turns off the policy.

resource "azurerm_policy_definition" "policy" {
  name         = "accTestPolicy"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "acceptance test policy definition"

  metadata = <<METADATA
    {
    "category": "General"
    }
METADATA

# Policy rule defines the logic to evaluate resources
  policy_rule = <<POLICY_RULE
    "if": {
      "not": {
        "field": "location",
        "in": "[parameters('allowedLocations')]"
      }
    },
    "then": {
      "effect": "audit"
    }
  }
POLICY_RULE

# Parameters allow to create reusable policies by making some values configurable
  parameters = <<PARAMETERS
  {
    "allowedLocations": {
      "type": "Array",
      "metadata": {
        "description": "The list of allowed locations for resources.",
        "displayName": "Allowed locations",
        "strongType": "location"
      }
    }
  }
PARAMETERS
}
