view: employeedepartmenthistory {
  sql_table_name: "ADVENTUREWORKS_2020_READ_ONLY"."EMPLOYEEDEPARTMENTHISTORY"
    ;;

  dimension: departmentid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."DEPARTMENTID" ;;
  }

  dimension: employeeid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."EMPLOYEEID" ;;
  }

  dimension_group: enddate {
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
    sql: ${TABLE}."ENDDATE" ;;
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

  dimension: shiftid {
    type: number
    value_format_name: id
    sql: ${TABLE}."SHIFTID" ;;
  }

  dimension_group: startdate {
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
    sql: ${TABLE}."STARTDATE" ;;
  }

  measure: count {
    type: count
    drill_fields: [employee.employeeid, department.groupname, department.name, department.departmentid]
  }
}
