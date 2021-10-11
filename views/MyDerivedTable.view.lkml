# If necessary, uncomment the line below to include explore_source.

# include: "adventureworks_snowflake.model.lkml"

view: myderivedtable {
  derived_table: {
    explore_source: employee1 {
      column: sum_vacationhours {}
      column: count {}
      column: departmentid { field: department.departmentid }
      filters: {
        field: employee1.gender
        value: "M"
      }
    }
  }
  dimension: sum_vacationhours {
    type: number
  }
  dimension: count {
    type: number
  }
  dimension: departmentid {
    type: number
  }
  measure: employeesvacationhours {
    type: number
    sql: ${sum_vacationhours} * ${count} ;;
  }
}
