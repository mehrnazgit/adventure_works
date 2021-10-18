connection: "adventureworks_snowflake"


# include all the views
include: "/views/**/*.view"

datagroup: adventureworks_snowflake_default_datagroup {
  #sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: adventureworks_snowflake_default_datagroup

explore: salesperson {
  join: salesterritory {
    relationship: one_to_one
    sql_on: ${salesperson.territoryid} = ${salesterritory.territoryid} ;;
  }
  label: "Sales Person"
  view_name:  salesperson
}

explore: employee {
  join: employeedepartmenthistory {
    relationship: one_to_one
    sql_on: ${employee.employeeid}=${employeedepartmenthistory.employeeid} ;;
  }
  label: "Employee"
  view_name:  employee
}

explore: creditcard {
  join: salesorderheader {
    relationship: one_to_one
    sql_on:  ${creditcard.creditcardid} = ${salesorderheader.creditcardid} ;;
  }
  label: "Creditcardtype per shipmentmethod"
  view_name: creditcard
}

explore: vendor {
  join: purchaseorderheader {
    relationship:  one_to_one
    sql_on:  ${vendor.vendorid} = ${purchaseorderheader.vendorid} ;;
  }
  label: "Vendor Status"
  view_name: vendor
}

explore: employee_department {
  join: employeedepartmenthistory {
    relationship: one_to_one
    sql_on: ${employee.employeeid} = ${employeedepartmenthistory.employeeid} ;;
  }
  join: department {
    relationship: one_to_one
    sql_on: ${department.departmentid} = ${employeedepartmenthistory.departmentid} ;;
  }
  join: shift {
    relationship: many_to_one
    sql_on: ${employeedepartmenthistory.shiftid} = ${shift.shiftid} ;;
  }
  # aggregate_table: rollup__count__departmentid__sum_vacationhours {
  #   query: {
  #     dimensions: [count, sum_vacationhours]
  #     measures: [employee.sum_vacationhours]
  #   }

  #   materialization: {
  #     datagroup_trigger: adventureworks_snowflake_default_datagroup
  #   }
  # }
  label: "Employee Department Info"
  view_name: employee
}

explore: salesorderheader {
  join: salesterritory {
    relationship: many_to_one
    sql_on:  ${salesorderheader.territoryid} = ${salesterritory.territoryid} ;;
  }
  label: "Sales"
  view_name:salesorderheader
}

explore: productlistpricehistory {
  label: "ProductListPrice"
  view_name: productlistpricehistory
}

explore: employee1 {
  from: employee
  join: employeebirthday {
    type: left_outer
    relationship: one_to_one
    sql_on: ${employeebirthday.employeeid}=${employee1.employeeid} ;;
  }
  join: employeedepartmenthistory {
    type: left_outer
    relationship: one_to_many
    sql_on: ${employee1.employeeid}=${employeedepartmenthistory.employeeid} ;;
  }
  join: employeepayhistory {
    type: left_outer
    relationship: one_to_many
    sql_on: ${employee1.employeeid}=${employeepayhistory.employeeid} ;;
  }
  join: department {
    type: inner
    relationship: many_to_one
    sql_on: ${department.departmentid}=${employeedepartmenthistory.departmentid} ;;
  }
  join: shift {
    type: left_outer
    relationship: many_to_one
    sql_on: ${employeedepartmenthistory.shiftid}=${shift.shiftid} ;;
  }
}
explore: myderivedtable {
  label: "Male Employees"
}
