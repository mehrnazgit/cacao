view: orders {
  sql_table_name: `demo_dataset.orders` ;;

  dimension: order_number {
    primary_key: yes
    type: string
    sql: ${TABLE}.Ordernumber ;;
  }

  dimension: sales_person_id {
    type: string
    sql: ${TABLE}.SalespersonID ;;
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}.ProductID ;;
  }

  dimension: order_line_number  {
    type: string
    sql: ${TABLE}.Orderlinenumber ;;
  }

  dimension_group: order_date  {
    type: time
    timeframes: [year, month, date]
    sql: ${TABLE}.OrderDate ;;
  }

  measure: sum_quantity_ordered {
    type: sum
    sql: ${TABLE}.QuantityOrdered ;;
  }

  dimension: price_each  {
    type: string
    sql: ${TABLE}.PriceEach ;;
  }

  dimension: total_price  {
    type: string
    sql: ${TABLE}.PriceTotal ;;
  }

  measure: sum_total_price {
    type: sum
    sql: ${TABLE}.PriceTotal ;;
  }

}
