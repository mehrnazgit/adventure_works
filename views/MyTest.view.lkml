view: mytest {
  set: myset1 {
    fields: [
      employee.employee,
      department.department
    ]
  }
  set: myset2 {
    fields: [
      myset1*,
      employeebirthday.birthdate
    ]
  }
  set: myset3 {
    fields: [
      myset2*,
      -department.department
    ]
  }
  dimension_group: time {
    type: time
    timeframes: [
      raw,
      month,
      month_name,
      year
    ]
    sql: ${TABLE}.time ;;
  }
  set: mytime {
    fields: [
      time_raw,
      time_month_name,
      time_year
    ]
  }
}
