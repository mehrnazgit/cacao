view: salesperson {

  sql_table_name: `demo_dataset.salesperson` ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.ID ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.Gender ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.Email ;;
  }

  dimension: mobile {
    type: string
    sql: ${TABLE}.Mobile ;;
  }

  dimension: nationality {
    type: string
    sql: ${TABLE}.Nationality ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.Title ;;
  }

  dimension: first_name {
    hidden: yes
    type: string
    sql: ${TABLE}.Firstname ;;
  }

  dimension: last_name {
    hidden: yes
    type: string
    sql: ${TABLE}.Lastname ;;
  }

  dimension: full_name {
    type: string
    sql: CONCAT(${first_name}, " ", ${last_name}) ;;
  }

  dimension_group: birth {
    type: time
    timeframes: [year, month, date]
    sql: ${TABLE}.DateOfBirth ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.Age ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.Country ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

}
