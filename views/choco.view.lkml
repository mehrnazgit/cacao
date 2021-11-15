view: choco {
  sql_table_name: `demo_dataset.chocolate`
    ;;

  dimension: bean_type {
    type: string
    sql: ${TABLE}.BeanType ;;
    description: "The variety (breed) of bean used, if provided."
  }

  measure: bean_type_count {
    type: count_distinct
    sql: ${bean_type} ;;
    drill_fields: [specific_bean_origin, company_count ,average_cocoa_percent, average_rating]
  }

  dimension: broad_bean_origin {
    type: string
    sql: ${TABLE}.BroadBeanOrigin ;;
    description: "The broad geo-region of origin for the bean."
  }

  measure: bean_origin_count {
    type: count_distinct
    sql: ${broad_bean_origin} ;;
  }


  dimension: cocoa_percent {
    type: number
    sql: ${TABLE}.CocoaPercent ;;
    description: "Cocoa percentage (darkness) of the chocolate bar being reviewed"
  }

  measure: average_cocoa_percent {
    type: average
    value_format: "0.00%"
    sql: ${cocoa_percent} ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.Company ;;
    description: "Name of the company manufacturing the bar."
    html:
    {% if value == 'Alexandre' %}
      <img src="http://img1.wsimg.com/isteam/ip/95960f1f-c6bd-4841-94fc-4cded1e80acc/Head%20Image.jpg" height=150 width=150 />
    {% elsif value == 'Chocolate Makers' %}
      <img src="https://chocoladeverkopers.nl/chocolade/wp-content/uploads/2016/06/chocolatemakers-amsterdam-chocolade-logo-380x250.jpg" height=125 width=150 />
    {% elsif value == 'Metropolitan' %}
      <img src="https://lh3.googleusercontent.com/0CVjGQLe3jkkjwi_0_AM2L6CbxU8quNGQcUJkQD0IqQNngMo9v1D8kfnqviol4C8hPzZi7sk8y6fATqVsNCd0cqt1out9tEtpOP6aCA6ssi8TeA3zA4Pubyiyo6tpZG7Lp3CM8rrtGkiOoyHRb9EavrkB_C3il8kK6RNUGHH9IxuTAFAJEHnciSIEsfJyb3VzeuWk6ja1aEX2xSIfLPfolxJXQt7_sf3-NF4UTq9jjFfE3ceRGSOfkuglw1NlCuY2QA1V8eUUmJCjNYKoiPMJ7v1T0BslndLOAbdo3spNZKTJv-T_UbfaYKHFGBmntczoeYIJbieCGy4HQxh9BqsAemkUHiOG3J9WPvAKii8nQ3U4Y38zCB6oGa8zIceIvMXxJVYbjjiRNq3PHfzSqYG-IISWxT_Xx0N_GhK1FiUKQpPG8KpDoiUCiJoaFURAk62rU5JeCNLnOmtyuUMZK3XYInqbja9fhe2X97GuDzMjgpaL0Q7R3nT6Zloqxddq9QCy-hddNoVTBxvOvP4Yo-YlTLGw_HVAapqyZGr1ulQSmXyucFa684ELogRuQSryhjpJLw8lDPHVHddii8W8MtMBjUWBQb2D35u3D6mYcg9kzv7piOIVBjiVsbl2RwgHw2ZpdynzX_2bvwZvrJmheiBGgrosFgLdKltqQuTfQr_ZZR8_7TIJacx06lXXw2MxbDyWBXGD8F-csSkVeCqyFDBzg=w389-h212-no?authuser=0" height=125 width=150 />
    {% endif %};;
  }

  dimension: countries {
    hidden: yes
    map_layer_name: countries
    sql: REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(${TABLE}.CompanyLocation, 'Amsterdam', 'Netherlands'), 'Eucador', 'Ecuador'), 'U.S.A.', 'America'), 'U.K.', 'England'), 'Niacragua', 'Nicaragua')  ;;
    description: "Name of the company manufacturing the bar."
  }

  dimension: company_location {
    map_layer_name: countries
    sql: LOWER(${countries}) ;;
    description: "Manufacturer base country."
    drill_fields: [company, company_count, average_rating]
    label: "Country"
    html:
    {% if value == 'america' %}
      <img src="https://www.countryflags.com/wp-content/uploads/united-states-of-america-flag-png-large.png" height=20 width=30 /> {{rendered_value|capitalize}}
    {% elsif value == 'england' %}
      <img src="https://www.countryflags.com/wp-content/uploads/united-kingdom-flag-png-large.png" height=20 width=30 /> {{rendered_value|capitalize}}
    {% elsif value == 'australia' %}
      <img src="https://www.countryflags.com/wp-content/uploads/flag-jpg-xl-9-scaled.jpg" height=20 width=30 /> {{rendered_value|capitalize}}
    {% elsif value == 'new zealand' %}
      <img src="https://www.countryflags.com/wp-content/uploads/new-zealand-flag-png-large.png" height=20 width=30 /> {{rendered_value|capitalize}}
    {% elsif value == 'belgium' %}
      <img src="https://www.countryflags.com/wp-content/uploads/flag-jpg-xl-18-scaled.jpg" height=20 width=30 /> {{rendered_value|capitalize}}
    {% elsif value == 'scotland' %}
      <img src="https://www.countryflags.com/wp-content/uploads/scotland-flag-jpg-xl.jpg" height=20 width=30 /> {{rendered_value|capitalize}}
    {% elsif value == 'puerto rico' %}
      <img src="https://www.countryflags.com/wp-content/uploads/puerto-rico-flag-jpg-xl.jpg" height=20 width=30 /> {{rendered_value|capitalize}}
    {% elsif value == 'austria' %}
      <img src="https://www.countryflags.com/wp-content/uploads/austria-austrian-flag-png-square-large.png" height=20 width=30 /> {{rendered_value|capitalize}}
    {% elsif value == 'costa rica' %}
      <img src="https://www.countryflags.com/wp-content/uploads/costa-rica-flag-png-large.png" height=20 width=30 /> {{rendered_value|capitalize}}
    {% elsif value == 'south korea' %}
      <img src="https://www.countryflags.com/wp-content/uploads/south-korea-flag-png-large.png" height=20 width=30 /> {{rendered_value|capitalize}}
    {% elsif value == 'argentina' %}
      <img src="https://www.countryflags.com/wp-content/uploads/flag-jpg-xl-7-scaled.jpg" height=20 width=30 /> {{rendered_value|capitalize}}
    {% elsif value == 'domincan republic' %}
      <img src="https://www.countryflags.com/wp-content/uploads/dominican-republic-flag-png-large.png" height=20 width=30 /> {{rendered_value|capitalize}}
    {% elsif value == 'south africa' %}
      <img src="https://www.countryflags.com/wp-content/uploads/south-africa-flag-png-large.png" height=20 width=30 /> {{rendered_value|capitalize}}
    {% elsif value == 'sao tome' %}
      <img src="https://www.countryflags.com/wp-content/uploads/sao-tome-and-principe-flag-png-large.png" height=20 width=30 /> {{rendered_value|capitalize}}
    {% elsif value == 'wales' %}
      <img src="https://www.countryflags.com/wp-content/uploads/wales-flag-jpg-xl.jpg" height=20 width=30 /> {{rendered_value|capitalize}}
    {% elsif value == 'bolivia' %}
      <img src="https://www.countryflags.com/wp-content/uploads/flag-jpg-xl-scaled.jpg" height=20 width=30 /> {{rendered_value|capitalize}}
    {% elsif value == 'nicaragua' %}
      <img src="https://www.countryflags.com/wp-content/uploads/nicaragua-flag-png-large.png" height=20 width=30 /> {{rendered_value|capitalize}}
    {% elsif value == 'portugal' %}
      <img src="https://www.countryflags.com/wp-content/uploads/portugal-flag-400.png" height=20 width=30 /> {{rendered_value|capitalize}}
    {% elsif value == 'st. lucia' %}
      <img src="https://www.countryflags.com/wp-content/uploads/saint-lucia-flag-png-large.png" height=20 width=30 /> {{rendered_value|capitalize}}
    {% elsif value == 'ecuador' %}
      <img src="https://www.countryflags.com/wp-content/uploads/ecuador-flag-png-large.png" height=20 width=30 /> {{rendered_value|capitalize}}
    {% elsif value == 'czech republic' %}
      <img src="https://www.countryflags.com/wp-content/uploads/czech-republic-flag-png-large.png" height=20 width=30 /> {{rendered_value|capitalize}}
    {% elsif value == 'martinique' %}
      <img src="https://www.countryflags.com/wp-content/uploads/france-flag-png-large.png" height=20 width=30 /> {{rendered_value|capitalize}}
    {% else %}
      <img src="https://www.countryflags.com/wp-content/uploads/{{value}}-flag-png-large.png" height=20 width=30 /> {{rendered_value|capitalize}}
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

  dimension: image1 {
    type: string
    sql: ${TABLE}.BeanType;;
    html: <img src="https://images.unsplash.com/photo-1553452118-621e1f860f43?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGNob2NvbGF0ZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60" height = "500" width = "300" />;;
  }

  dimension: image2 {
    type: string
    sql: ${TABLE}.ref;;
    html: <img src="https://images.unsplash.com/photo-1505252929202-c4f39cda4d49?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1287&q=80" height = "500" width = "300" />;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: company_count {
    type: count_distinct
    sql: ${company} ;;
    drill_fields: [company, bean_origin_count, average_rating]
    description: "distinct count of companies."
    label: "Distinct Count of Companies"
  }

  measure: average_rating{
    type: average
    value_format: "0.0"
    sql: round(${rating}) ;;
    html:
    {% for i in (1..5) %}
    {% if i > value %}
      ★
    {% else %}
      <font color="orange">★</font>
    {% endif %}
    {% endfor %} ;;
    description: "average rate."
    label: "Average Rate"
  }
}
