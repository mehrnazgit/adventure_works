view: contactcreditcard {
  sql_table_name: "ADVENTUREWORKS_2020_READ_ONLY"."CONTACTCREDITCARD"
    ;;

  dimension: contactid {
    type: number
    value_format_name: id
    sql: ${TABLE}."CONTACTID" ;;
  }

  dimension: creditcardid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."CREDITCARDID" ;;
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

  measure: count {
    type: count
    drill_fields: [creditcard.creditcardid]
  }
}
