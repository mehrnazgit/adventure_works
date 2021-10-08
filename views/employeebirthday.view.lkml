# If necessary, uncomment the line below to include explore_source.

# include: "adventureworks_snowflake.model.lkml"

view: employeebirthday {
  derived_table: {
    explore_source: employee {
      column: gender {}
      column: employeeid {}
      column: birthdate_date {}
    }
  }
  dimension: gender {
    type: string
  }
  dimension: employeeid {
    type: number
  }
  dimension: birthdate_date {
    type: date
  }
}
