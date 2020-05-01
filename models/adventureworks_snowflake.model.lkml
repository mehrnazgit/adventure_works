connection: "adventureworks_snowflake"

# include all the views
include: "/views/**/*.view"

datagroup: adventureworks_snowflake_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
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
