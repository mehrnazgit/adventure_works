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
    html:
    {% if value == 'FR' %}
      <img src="https://cdn.pixabay.com/photo/2012/04/11/15/19/france-28463_960_720.png" height=20 width=30 /> {{rendered_value}}
    {% elsif value == "GB" %}
      <img src="https://upload.wikimedia.org/wikipedia/commons/a/ae/Flag_of_the_United_Kingdom.svg" height=20 width=30 /> {{rendered_value}}
    {% elsif value == "CA" %}
      <img src="https://www.alaskapublic.org/wp-content/uploads/2020/03/ca-flag.jpg" height=20 width=30 /> {{rendered_value}}
    {% elsif value == "US" %}
      <img src="https://upload.wikimedia.org/wikipedia/commons/a/a4/Flag_of_the_United_States.svg" height=20 width=30 /> {{rendered_value}}
    {% elsif value == "DE" %}
      <img src="https://upload.wikimedia.org/wikipedia/en/b/ba/Flag_of_Germany.svg" height=20 width=30 /> {{rendered_value}}
    {% elsif value == "AU" %}
    <p><img src="https://cdn.britannica.com/78/6078-004-77AF7322/Flag-Australia.jpg" height=20 width=30 /> {{rendered_value}}
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
