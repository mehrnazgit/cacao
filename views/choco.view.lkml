view: choco {
  sql_table_name: `demo_dataset.choco`
    ;;

  dimension: bean_type {
    type: string
    sql: ${TABLE}.BeanType ;;
    description: "The variety (breed) of bean used, if provided."
  }

  dimension: broad_bean_origin {
    type: string
    sql: ${TABLE}.BroadBeanOrigin ;;
    description: "The broad geo-region of origin for the bean."
  }

  dimension: cocoa_percent {
    type: number
    sql: ${TABLE}.CocoaPercent ;;
    description: "Cocoa percentage (darkness) of the chocolate bar being reviewed"
  }

  dimension: company {
    type: string
    sql: ${TABLE}.Company ;;
    description: "Name of the company manufacturing the bar."
  }

  dimension: company_location {
    type: string
    sql: ${TABLE}.CompanyLocation ;;
    description: "Manufacturer base country."
  }

  dimension: rating {
    type: number
    sql: ${TABLE}.Rating ;;
    description: "Expert rating for the bar."
  }

  dimension: ref {
    type: number
    sql: ${TABLE}.REF ;;
    description: "A value linked to when the review was entered in the database. Higher = more recent."
  }

  dimension: review_date {
    type: number
    sql: ${TABLE}.ReviewDate ;;
    description: "Date of publication of the review."
  }

  dimension: specific_bean_origin {
    type: string
    sql: ${TABLE}.SpecificBeanOrigin ;;
    description: "The specific geo-region of origin for the bar."
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
