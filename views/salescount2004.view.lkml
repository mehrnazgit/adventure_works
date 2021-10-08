# If necessary, uncomment the line below to include explore_source.

# include: "adventureworks_snowflake.model.lkml"

view: salesount2004 {
  derived_table: {
    explore_source: salesorderheader {
      column: subtotal_salescount {}
      column: shipdate_month {}
      filters: {
        field: salesorderheader.shipdate_date
        value: "2004"
      }
    }
  }
  dimension: subtotal_salescount {
    type: number
  }
  dimension: shipdate_month {
    type: date_month
  }
}
