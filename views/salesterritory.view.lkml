view: salesterritory {
  sql_table_name: "ADVENTUREWORKS_2020_READ_ONLY"."SALESTERRITORY"
    ;;

  dimension: costlastyear {
    type: number
    sql: ${TABLE}."COSTLASTYEAR" ;;
  }

  dimension: costytd {
    type: number
    sql: ${TABLE}."COSTYTD" ;;
  }

  dimension: countryregioncode {
    type: string
    sql: ${TABLE}."COUNTRYREGIONCODE" ;;
    html: {% if value == 'US' %}
    <p><img src="https://upload.wikimedia.org/wikipedia/commons/a/a4/Flag_of_the_United_States.svg" height=20 width=20>{{rendered_value}}</p>
    {% endif %};;
  }

  dimension: group {
    type: string
    sql: ${TABLE}."GROUP" ;;
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

  dimension: rowguid {
    type: string
    sql: ${TABLE}."ROWGUID" ;;
  }

  dimension: saleslastyear {
    type: number
    sql: ${TABLE}."SALESLASTYEAR" ;;
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
    drill_fields: [name]
  }
}
