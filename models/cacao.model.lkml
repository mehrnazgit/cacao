connection: "new_demo_connection"

# include all the views
include: "/views/**/*.view"

datagroup: cacao_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: cacao_default_datagroup

explore: choco {
  hidden: no
}

explore: salesperson {
  hidden: yes
}

explore: orders {
  hidden: yes
  join: salesperson {
    type: full_outer
    relationship: many_to_one
    sql_on: ${orders.sales_person_id} = ${salesperson.id} ;;
  }
  join: chocolate_products {
    type: full_outer
    relationship: many_to_one
    sql_on: ${orders.product_id} = ${chocolate_products.product_id} ;;
  }
  label: "Chocolate Orders"
}
explore: chocolate_products{
  hidden: yes
}
