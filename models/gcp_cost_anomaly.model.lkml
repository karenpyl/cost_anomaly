# Define the database connection to be used for this model.
connection: "cost_anomaly"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: gcp_cost_anomaly_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: gcp_cost_anomaly_default_datagroup

explore: gcp_billing_export_unpartitioned { }

explore: user_order {
  description: "abc bac bac"

  sql_always_where: ${user_id} = {{ _user_attributes['employee_id'] }} or ${manager_id} = {{ _user_attributes['employee_id']}} or ${director_id} = {{ _user_attributes['employee_id']}};;

  # access_filter: {
  #   field: user_order.country
  #   user_attribute: country
  # }
  }

# # or ${country} in ({{ _user_attributes['country'] }})

# access_grant: can_view_country_data {
#   user_attribute: department
#   allowed_values: [ "Finance", "Executive" ]
# }
