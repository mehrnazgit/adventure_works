view: salesperson {
  sql_table_name: "ADVENTUREWORKS_2020_READ_ONLY"."SALESPERSON"
    ;;
  drill_fields: [salespersonid]

  dimension: salespersonid {
    primary_key: yes
    type: number
    sql: ${TABLE}."SALESPERSONID" ;;
  }

  dimension: bonus {
    type: number
    sql: ${TABLE}."BONUS" ;;
  }

  dimension: commissionpct {
    type: number
    sql: ${TABLE}."COMMISSIONPCT" ;;
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

  dimension: rowguid {
    type: string
    sql: ${TABLE}."ROWGUID" ;;
  }

  dimension: saleslastyear {
    type: number
    sql: ${TABLE}."SALESLASTYEAR" ;;
  }

  dimension: salesquota {
    type: number
    sql: ${TABLE}."SALESQUOTA" ;;
  }

  dimension: salesytd {
    type: number
    sql: ${TABLE}."SALESYTD" ;;
  }

  dimension: territoryid {
    type: number
    value_format_name: id
    sql: ${TABLE}."TERRITORYID" ;;
  }

  measure: count {
    type: count
    drill_fields: [salespersonid, salesorderheader.count]
  }
}
