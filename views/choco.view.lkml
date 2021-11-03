view: choco {
  sql_table_name: `demo_dataset.chocolate`
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

  dimension: countries {
    hidden: no
    map_layer_name: countries
    sql: REPLACE(${TABLE}.CompanyLocation, 'Amsterdam', 'Netherlands')  ;;
    description: "Name of the company manufacturing the bar."
  }


  dimension: company_location {
    map_layer_name: countries
    sql: LOWER(${countries}) ;;
    description: "Manufacturer base country."
    html:
    {% if value == 'u.s.a.' %}
      <img src="https://www.countryflags.com/wp-content/uploads/united-states-of-america-flag-png-large.png" height=20 width=30 /> {{rendered_value}}
    {% elsif value == 'u.k.' %}
      <img src="https://www.countryflags.com/wp-content/uploads/united-kingdom-flag-png-large.png" height=20 width=30 /> {{rendered_value}}
    {% elsif value == 'australia' %}
      <img src="https://www.countryflags.com/wp-content/uploads/flag-jpg-xl-9-scaled.jpg" height=20 width=30 /> {{rendered_value}}
    {% elsif value == 'new zealand' %}
      <img src="https://www.countryflags.com/wp-content/uploads/new-zealand-flag-png-large.png" height=20 width=30 /> {{rendered_value}}
    {% elsif value == 'belgium' %}
      <img src="https://www.countryflags.com/wp-content/uploads/flag-jpg-xl-18-scaled.jpg" height=20 width=30 /> {{rendered_value}}
    {% else %}
      <img src="https://www.countryflags.com/wp-content/uploads/{{value}}-flag-png-large.png" height=20 width=30 /> {{rendered_value}}
    {% endif %};;
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

  dimension_group: review_date {
    type: time
    timeframes: [year, month, date]
    sql: ${TABLE}.ReviewDate ;;
    description: "Year of publication of the review."
  }

  dimension: specific_bean_origin {
    type: string
    sql: ${TABLE}.SpecificBeanOrigin ;;
    description: "The specific geo-region of origin for the bar."
  }

  dimension: image {
    type: string
    sql: ${TABLE}.BeanType;;
    html: <img src="https://images.unsplash.com/photo-1553452118-621e1f860f43?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGNob2NvbGF0ZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60" height = "500" width = "300" />;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: company_count {
    type: count_distinct
    sql: ${company} ;;
    drill_fields: [company]
    description: "distinct count of companies."
    label: "Distinct Count of Companies"
  }

  measure: average_rating{
    type: average
    sql: ${rating} ;;
    description: "average rate."
  }
}
