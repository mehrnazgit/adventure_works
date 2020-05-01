view: purchaseorderheader {
  sql_table_name: "ADVENTUREWORKS_2020_READ_ONLY"."PURCHASEORDERHEADER"
    ;;

  dimension: employeeid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."EMPLOYEEID" ;;
  }

  dimension: freight {
    type: number
    sql: ${TABLE}."FREIGHT" ;;
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

  dimension_group: orderdate {
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
    sql: ${TABLE}."ORDERDATE" ;;
  }

  dimension: purchaseorderid {
    type: number
    value_format_name: id
    sql: ${TABLE}."PURCHASEORDERID" ;;
  }

  dimension: revisionnumber {
    type: number
    sql: ${TABLE}."REVISIONNUMBER" ;;
  }

  dimension_group: shipdate {
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
    sql: ${TABLE}."SHIPDATE" ;;
  }

  dimension: shipmethodid {
    type: number
    value_format_name: id
    sql: ${TABLE}."SHIPMETHODID" ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: subtotal {
    type: number
    sql: ${TABLE}."SUBTOTAL" ;;
  }

  dimension: taxamt {
    type: number
    sql: ${TABLE}."TAXAMT" ;;
  }

  dimension: totaldue {
    type: number
    sql: ${TABLE}."TOTALDUE" ;;
  }

  dimension: vendorid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."VENDORID" ;;
  }

  measure: count {
    type: count
    drill_fields: [vendor.name, vendor.vendorid, employee.employeeid]
  }
}
