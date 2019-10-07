connection: "looker_external"

# include all the views
include: "/views/**/*.view"

datagroup: database_label_and_desc_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: database_label_and_desc_default_datagroup

explore: all_types {}

explore: order_items {
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: orders {
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: orders_view {
  join: users {
    type: left_outer
    sql_on: ${orders_view.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: users {}
