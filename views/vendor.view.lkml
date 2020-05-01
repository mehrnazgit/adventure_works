view: vendor {
  sql_table_name: "ADVENTUREWORKS_2020_READ_ONLY"."VENDOR"
    ;;
  drill_fields: [vendorid]

  dimension: vendorid {
    primary_key: yes
    type: number
    sql: ${TABLE}."VENDORID" ;;
  }

  dimension: accountnumber {
    type: string
    sql: ${TABLE}."ACCOUNTNUMBER" ;;
  }

  dimension: activeflag {
    type: yesno
    sql: ${TABLE}."ACTIVEFLAG" ;;
  }

  dimension: creditrating {
    type: number
    sql: ${TABLE}."CREDITRATING" ;;
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

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: preferredvendorstatus {
    type: yesno
    sql: ${TABLE}."PREFERREDVENDORSTATUS" ;;
  }

  dimension: purchasingwebserviceurl {
    type: string
    sql: ${TABLE}."PURCHASINGWEBSERVICEURL" ;;
  }

  measure: count {
    type: count
    drill_fields: [vendorid, name, purchaseorderheader.count]
  }
}
