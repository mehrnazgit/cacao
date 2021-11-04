connection: "new_demo_connection"

# include all the views
include: "/views/**/*.view"

datagroup: cacao_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: cacao_default_datagroup

explore: choco {}

explore: salesperson {
  join: orders {
    type: left_outer
    relationship: one_to_many
    sql_on: ${salesperson.id} = ${orders.sales_person_id} ;;
  }
}

explore: orders {}
