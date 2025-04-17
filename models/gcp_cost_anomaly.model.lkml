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
