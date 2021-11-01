view: employee {
  sql_table_name: "ADVENTUREWORKS_2020_READ_ONLY"."EMPLOYEE"
    ;;
  drill_fields: [employeeid]

  dimension: employeeid {
    primary_key: yes
    type: number
    sql: ${TABLE}."EMPLOYEEID" ;;
    group_label: "emp"
  }

  dimension_group: birthdate {
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
    sql: ${TABLE}."BIRTHDATE" ;;
    group_label: "emp"
  }

  dimension: contactid {
    type: number
    value_format_name: id
    sql: ${TABLE}."CONTACTID" ;;
  }

  dimension: currentflag {
    type: yesno
    sql: ${TABLE}."CURRENTFLAG" ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}."GENDER" ;;
  }

  dimension_group: hiredate {
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
    sql: ${TABLE}."HIREDATE" ;;
  }

  dimension: loginid {
    type: string
    sql: ${TABLE}."LOGINID" ;;
  }

  dimension: managerid {
    type: number
    value_format_name: id
    sql: ${TABLE}."MANAGERID" ;;
  }

  dimension: maritalstatus {
    type: string
    sql: ${TABLE}."MARITALSTATUS" ;;
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

  dimension: nationalidnumber {
    type: string
    sql: ${TABLE}."NATIONALIDNUMBER" ;;
  }

  dimension: rowguid {
    type: string
    sql: ${TABLE}."ROWGUID" ;;
  }

  dimension: salariedflag {
    type: yesno
    sql: ${TABLE}."SALARIEDFLAG" ;;
  }

  dimension: sickleavehours {
    type: number
    sql: ${TABLE}."SICKLEAVEHOURS" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."TITLE" ;;
  }

  dimension: vacationhours {
    type: number
    sql: ${TABLE}."VACATIONHOURS" ;;
  }

  measure: count {
    type: count
    drill_fields: [employeeid, employeedepartmenthistory.count, purchaseorderheader.count]
  }
  measure: sum_vacationhours {
    type: sum
    sql: ${vacationhours} ;;
  }
}
