require 'pg'     
require 'sinatra'
require 'sinatra/reloader' if development?


get '/' do
  erb :index
end

def run_sql(sql)
  db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'name_of_database'})
  result = db.exec(sql)
  db.close
  return result
end





