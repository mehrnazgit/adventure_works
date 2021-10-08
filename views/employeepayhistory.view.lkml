view: employeepayhistory {
  sql_table_name: "ADVENTUREWORKS_2020_READ_ONLY"."EMPLOYEEPAYHISTORY"
    ;;

  dimension: employeeid {
    type: number
    value_format_name: id
    sql: ${TABLE}."EMPLOYEEID" ;;
  }

  dimension_group: modifieddate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."MODIFIEDDATE" ;;
  }

  dimension: payfrequency {
    type: number
    sql: ${TABLE}."PAYFREQUENCY" ;;
  }

  dimension: rate {
    type: number
    sql: ${TABLE}."RATE" ;;
  }

  dimension_group: ratechangedate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."RATECHANGEDATE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
