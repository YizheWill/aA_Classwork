require 'pg'

def execute(sql)
  # execute query
  conn = PG::Connection.open(:dbname => 'sqlzoo')
  # returns an array of arrays to represent a table
  query_result = conn.exec(sql).values
  # close connection to Postgres
  conn.close

  # return result of query
  query_result
end
