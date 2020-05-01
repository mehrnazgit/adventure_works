view: salesorderheader {
  sql_table_name: "ADVENTUREWORKS_2020_READ_ONLY"."SALESORDERHEADER"
    ;;

  dimension: accountnumber {
    type: string
    sql: ${TABLE}."ACCOUNTNUMBER" ;;
  }

  dimension: billtoaddressid {
    type: string
    sql: ${TABLE}."BILLTOADDRESSID" ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}."COMMENT" ;;
  }

  dimension: contactid {
    type: string
    sql: ${TABLE}."CONTACTID" ;;
  }

  dimension: creditcardapprovalcode {
    type: string
    sql: ${TABLE}."CREDITCARDAPPROVALCODE" ;;
  }

  dimension: creditcardid {
    type: string
    # hidden: yes
    sql: ${TABLE}."CREDITCARDID" ;;
  }

  dimension: currencyrateid {
    type: string
    sql: ${TABLE}."CURRENCYRATEID" ;;
  }

  dimension: customerid {
    type: string
    sql: ${TABLE}."CUSTOMERID" ;;
  }

  dimension_group: duedate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DUEDATE" ;;
  }

  dimension: freight {
    type: number
    sql: ${TABLE}."FREIGHT" ;;
  }

  dimension_group: modifieddate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."MODIFIEDDATE" ;;
  }

  dimension: onlineorderflag {
    type: yesno
    sql: ${TABLE}."ONLINEORDERFLAG" ;;
  }

  dimension_group: orderdate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."ORDERDATE" ;;
  }

  dimension: purchaseordernumber {
    type: string
    sql: ${TABLE}."PURCHASEORDERNUMBER" ;;
  }

  dimension: revisionnumber {
    type: string
    sql: ${TABLE}."REVISIONNUMBER" ;;
  }

  dimension: rowguid {
    type: string
    sql: ${TABLE}."ROWGUID" ;;
  }

  dimension: salesorderid {
    type: string
    sql: ${TABLE}."SALESORDERID" ;;
  }

  dimension: salesordernumber {
    type: string
    sql: ${TABLE}."SALESORDERNUMBER" ;;
  }

  dimension: salespersonid {
    type: string
    sql: ${TABLE}."SALESPERSONID" ;;
  }

  dimension_group: shipdate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."SHIPDATE" ;;
  }

  dimension: shipmethodid {
    type: string
    sql: ${TABLE}."SHIPMETHODID" ;;
  }

  dimension: shiptoaddressid {
    type: string
    sql: ${TABLE}."SHIPTOADDRESSID" ;;
  }

  dimension: status {
    type: string
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

  dimension: territoryid {
    type: string
    sql: ${TABLE}."TERRITORYID" ;;
  }

  dimension: totaldue {
    type: number
    sql: ${TABLE}."TOTALDUE" ;;
  }

  measure: count {
    type: count
    drill_fields: [creditcard.creditcardid]
  }

  measure: subtotal_salescount {
    type: sum
    sql: ${TABLE}."SUBTOTAL" ;;
  }

  measure: sum_taxamt {
    type: sum
    sql:  ${TABLE}."TAXAMT" ;;
  }
}
