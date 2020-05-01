view: creditcard {
  sql_table_name: "ADVENTUREWORKS_2020_READ_ONLY"."CREDITCARD"
    ;;
  drill_fields: [creditcardid]

  dimension: creditcardid {
    primary_key: yes
    type: number
    sql: ${TABLE}."CREDITCARDID" ;;
  }

  dimension: cardnumber {
    type: string
    sql: ${TABLE}."CARDNUMBER" ;;
  }

  dimension: cardtype {
    type: string
    sql: ${TABLE}."CARDTYPE" ;;
  }

  dimension: expmonth {
    type: number
    sql: ${TABLE}."EXPMONTH" ;;
  }

  dimension: expyear {
    type: number
    sql: ${TABLE}."EXPYEAR" ;;
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
    drill_fields: [creditcardid, contactcreditcard.count, salesorderheader.count]
  }
}
