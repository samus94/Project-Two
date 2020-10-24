require "pg"
require_relative "/data_access.rb"

sql = "insert into games (name, image_url, description) values ('#{'name'}','#{"image_url"}', '#{"description"}');"
 
run_sql(sql)