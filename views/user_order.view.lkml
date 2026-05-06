view: user_order {
  sql_table_name: `decoded-vision-448616-m1.gcp_cost_anomaly.user_order` ;;

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
  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
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
  }

  dimension: director_id {
    type: number
    sql: 0;;
  }
  measure: count {
    label: "Number of Orders"
    type: count
    drill_fields: [order_id]
  }

  measure: count_distinct_user {
    label: "Number of users"
    type: count_distinct
    sql: ${user_id} ;;
    drill_fields: [user_id, first_name, last_name, manager_id,manager_fullname,state]
  }
}
