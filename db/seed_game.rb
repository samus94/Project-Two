require "pg"
require_relative "data_access.rb"

name = "Overwatch"

image_url = "https://images-na.ssl-images-amazon.com/images/I/91lid74MqmL.jpg"

description = "First Person Shooter"

sql = "insert into games (name, image_url, description) values ('#{name}','#{image_url}', '#{description}');"
 
run_sql(sql)