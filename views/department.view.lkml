view: department {
  sql_table_name: "ADVENTUREWORKS_2020_READ_ONLY"."DEPARTMENT"
    ;;
  drill_fields: [departmentid]

  dimension: departmentid {
    primary_key: yes
    type: number
    sql: ${TABLE}."DEPARTMENTID" ;;
  }

  dimension: groupname {
    type: string
    sql: ${TABLE}."GROUPNAME" ;;
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

  measure: count {
    type: count
    drill_fields: [departmentid, groupname, name, employeedepartmenthistory.count]
  }
}
