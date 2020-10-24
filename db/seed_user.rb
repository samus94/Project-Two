require "bcrypt"
require "pg"
require_relative 'data_access.rb'

  
email = "dt@ga.co"
password_digest = BCrypt::Password.create("pudding")

sql = "insert into users (email, password_digest) values ('#{email}','#{password_digest}');"

run_sql(sql)