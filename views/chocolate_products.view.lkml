view: chocolate_products {
  sql_table_name: `demo_dataset.chocolate_products` ;;

  dimension: product_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.ProductID ;;
  }

  dimension: product_code {
    type: string
    sql: ${TABLE}.Productcode ;;
  }

  dimension: manufacturer {
    type: string
    sql: ${TABLE}.Manufacturer ;;
  }

  measure: count_manufacturer {
    type: count_distinct
    sql:  ${TABLE}.Manufacturer;;
  }

  dimension: manufacturer_location  {
    map_layer_name: countries
    sql: ${TABLE}.ManufacturerLocation ;;
  }

  dimension_group: review  {
    type: time
    timeframes: [year, month, date]
    sql: ${TABLE}.ReviewDate ;;
  }

  dimension: bean_origin  {
    map_layer_name: countries
    sql: ${TABLE}.CountryofBeanOrigin ;;
  }

  dimension: bean_origin_or_bar_name  {
    type: string
    sql: ${TABLE}.BeanOriginOrBarName ;;
  }

  dimension: cocoa_percent  {
    type: string
    sql: ${TABLE}.CocoaPercent ;;
  }

  measure: average_cocoa_percent {
    type: average
    sql: ${TABLE}.CocoaPercent ;;
  }

  dimension: ingredients  {
    type: string
    sql: ${TABLE}.Ingredients ;;
  }

  dimension: memorable_characteristic  {
    type: string
    sql: ${TABLE}.MostMemorableCharacteristics ;;
  }

  dimension: rating  {
    type: string
    sql: ${TABLE}.Rating ;;
  }

  measure: sum_rating {
    type: sum
    sql: ${TABLE}.Rating ;;
  }

  dimension: price_per_unit  {
    type: string
    sql: ${TABLE}.PricePerUnit ;;
  }

}
