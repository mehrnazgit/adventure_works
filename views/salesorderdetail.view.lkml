view: salesorderdetail {
  sql_table_name: "ADVENTUREWORKS_2020_READ_ONLY"."SALESORDERDETAIL"
    ;;
  drill_fields: [salesorderdetailid]

  dimension: salesorderdetailid {
    primary_key: yes
    type: number
    sql: ${TABLE}."SALESORDERDETAILID" ;;
  }

  dimension: carriertrackingnumber {
    type: string
    sql: ${TABLE}."CARRIERTRACKINGNUMBER" ;;
  }

  dimension: linetotal {
    type: number
    sql: ${TABLE}."LINETOTAL" ;;
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

  dimension: orderqty {
    type: number
    sql: ${TABLE}."ORDERQTY" ;;
  }

  dimension: productid {
    type: number
    value_format_name: id
    sql: ${TABLE}."PRODUCTID" ;;
  }

  dimension: rowguid {
    type: string
    sql: ${TABLE}."ROWGUID" ;;
  }

  dimension: salesorderid {
    type: number
    value_format_name: id
    sql: ${TABLE}."SALESORDERID" ;;
  }

  dimension: specialofferid {
    type: number
    value_format_name: id
    sql: ${TABLE}."SPECIALOFFERID" ;;
  }

  dimension: unitprice {
    type: number
    sql: ${TABLE}."UNITPRICE" ;;
  }

  dimension: unitpricediscount {
    type: number
    sql: ${TABLE}."UNITPRICEDISCOUNT" ;;
  }

  measure: count {
    type: count
    drill_fields: [salesorderdetailid]
  }
}
