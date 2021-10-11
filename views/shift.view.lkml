view: shift {
  sql_table_name: "ADVENTUREWORKS_2020_READ_ONLY"."SHIFT"
    ;;
  drill_fields: [shiftid]

  dimension: shiftid {
    primary_key: yes
    type: number
    sql: ${TABLE}."SHIFTID" ;;
  }

  dimension_group: endtime {
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
    sql: ${TABLE}."ENDTIME" ;;
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

  dimension_group: starttime {
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
    sql: ${TABLE}."STARTTIME" ;;
  }

  measure: count {
    type: count
    drill_fields: [shiftid, name]
  }
  dimension_group: shift_duration {
    type: duration
    sql_start: ${starttime_date};;
    sql_end: ${endtime_date};;
    intervals: [hour]
  }
}
