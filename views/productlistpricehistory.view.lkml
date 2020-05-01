view: productlistpricehistory {
  sql_table_name: "ADVENTUREWORKS_2020_READ_ONLY"."PRODUCTLISTPRICEHISTORY"
    ;;

  dimension_group: enddate {
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
    sql: ${TABLE}."ENDDATE" ;;
  }

  dimension: listprice {
    type: number
    sql: ${TABLE}."LISTPRICE" ;;
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

  dimension: productid {
    type: number
    value_format_name: id
    sql: ${TABLE}."PRODUCTID" ;;
  }

  dimension_group: startdate {
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
    sql: ${TABLE}."STARTDATE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
