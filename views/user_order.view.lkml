view: user_order {
  sql_table_name: `decoded-vision-448616-m1.gcp_cost_anomaly.user_order` ;;


###### Parameters #######
  parameter: report_period_picker {
    description: "Use with the dymamic period dimension"
    type: unquoted
    allowed_value: {
      label: "Week"
      value: "week"
    }
    allowed_value: {
      label: "Quarter"
      value: "quarter"
    }
    allowed_value: {
      label: "Year"
      value: "year"
    }
  }

  parameter: measure_picker {
    description: "Use with the dynamic measure"
    type: unquoted
    allowed_value: {
      label: "Revenue"
      value: "revenue"
    }
    allowed_value: {
      label: "Num of Order"
      value: "num_of_order"
    }
  }

###############################################################

  dimension: dynamic_period_select {
    label_from_parameter: report_period_picker
    type: string
    sql:
    {% if report_period_picker._parameter_value == 'week' %}
      ${created_week}
    {% elsif report_period_picker._parameter_value == 'quarter' %}
      ${created_quarter}
    {% elsif report_period_picker._parameter_value == 'year' %}
      ${created_year}
    {% else %}
      NULL
    {% endif %} ;;
  }

  measure: dynamic_measure {
    label: "Dynamic Measure"
    type: sum
    sql:
    {% if measure_picker._parameter_value == 'revenue' %}
    ${sales}
    {% elsif measure_picker._parameter_value == 'num_of_order' %}
    ${num_of_item}
    {% else %}
    NULL
    {% endif %} ;;
  }


###############################################################
 dimension: order_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
    # required_access_grants: [can_view_country_data]
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: delivered {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.delivered_at ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
    link: {
      label: "Explore"
      url: "https://b07c8727-7303-4dae-8908-f138a59b4f27.looker.app/explore/gcp_cost_anomaly/user_order?fields=user_order.first_name, user_order.last_name, user_order.count&f[user_order.last_name]={{value}}"
    }
  }
  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: sales {
    type: number
    sql: ${TABLE}.latitude ;;
  }


  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: location {
    type: location
    sql_latitude:${latitude} ;;
    sql_longitude:${longitude} ;;
  }

  dimension: manager_fullname {
    type: string
    sql: ${TABLE}.manager_fullname ;;
  }
  dimension: manager_id {
    type: number
    sql: ${TABLE}.manager_id ;;
  }
  dimension: num_of_item {
    type: number
    sql: ${TABLE}.num_of_item ;;
  }

  dimension: postal_code {
    type: number
    sql: ${TABLE}.postal_code ;;
  }
  dimension: returned_at {
    type: string
    sql: ${TABLE}.returned_at ;;
  }
  dimension_group: shipped {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.shipped_at ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: street_address {
    type: string
    sql: ${TABLE}.street_address ;;
  }
  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }
  dimension: user_geom {
    type: string
    sql: ${TABLE}.user_geom ;;
  }
  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
    link: {
      label: "Full Detail"
      url: "/dashboards/1Ysuu4K1bAdBbcpiTLH114?User+ID={{ value }}"
    }
  }

  dimension: director_id {
    type: number
    sql: 0;;
  }
  measure: count {
    label: "Number of Orders"
    type: count
    drill_fields: [user_details*]
  }

  measure: revenue {
    label: "Total Revenue"
    type: sum
    sql: ${num_of_item} ;;
    value_format_name: gbp_0
  }

  measure: count_distinct_user {
    label: "Number of users"
    type: count_distinct
    sql: ${user_id} ;;
    drill_fields: [user_details*]
  }

  set: user_details {
    fields: [user_id, first_name, last_name, manager_id,manager_fullname,state]
  }
}
