require 'pg'     
require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'db/data_access.rb'
require 'bcrypt'
require 'httparty'
enable :sessions



def logged_in?()
  if session[:user_id]
    true
  else 
    false
  end
end

def current_user()
  find_user_by_id(session[:user_id])
end

get '/' do
  
  games = all_games()
  erb :index, locals: {
    games:games 
  }
end

get '/games/new' do
  redirect '/login' unless logged_in?
  erb :new
end

get '/games/:id' do
  # if !logged_in?
  #   redirect '/login'
  # end

  game = find_game_by_id(params['id'])
  erb :details, locals: {game: game}

end

post '/games' do
  sql = "insert into games (name, image_url, description) values ('#{params["name"]}','#{params["image_url"]}','#{params["description"]}');"

  run_sql(sql)

  redirect "/"

end


delete '/games/:id' do
  # params ["id"]
  db = PG.connect(dbname: 'gameshareit')
  sql = "DELETE FROM games WHERE id = #{params["id"]};"
  db.exec(sql)
  db.close 

  redirect "/"
end


get '/games/:id/edit' do
  db = PG.connect(dbname: 'gameshareit')
  sql = "SELECT * FROM games WHERE id = #{params['id']};"
  results = db.exec(sql)
  db.close


  erb :edit, locals: { game: results[0]}
end

patch '/games/:id' do
  db = PG.connect(dbname: 'gameshareit')
  sql = "update games set name = '#{params["name"]}', image_url = '#{params["image_url"]}', description = '#{params["description"]}' where id = #{params["id"]};"

  db.exec(sql)
  redirect "/games/#{params["id"]}"
end

get '/login' do
  erb :login
end

post '/login' do
  user = find_user_by_email(params['email'])

  if BCrypt::Password.new(user['password_digest']).==(params['password'])
    session[:user_id] = user['id']
    redirect "/"
  else 
    erb :login
  end
end

get '/login/newacc' do
  erb :newacc
end

post '/login/newacc' do

  email = "#{params["email"]}"
  password_digest = BCrypt::Password.create("#{params["password"]}")

  sql = "insert into users (email, password_digest) values ('#{email}','#{password_digest}');"

  run_sql(sql)
  
  redirect "/"

end


delete '/logout' do
  session[:user_id]=nil
  redirect '/login'
end 
