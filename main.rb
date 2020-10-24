require 'pg'     
require 'sinatra'
require 'sinatra/reloader' if development?



def run_sql(sql)
  db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'name_of_database'})
  result = db.exec(sql)
  db.close
  return result
end

def logged_in?()
  if session[:user_id]
    true
  else 
    false
  end
end


get '/' do
  games = all_games()
  erb :index, locals: {
    games:games 
  }
end

get '/games/new' do
  redirect '/login' unless logged_in?
  erb: new
end

get '/games/:id' do
  if !logged_in?
    redirect '/login'
  end

  game = find_game_by_id(params['id'])
  erb :details, locals: {game: game}

end

post '/games' do
  sql = "insert into games (name, image_url) values ('#{params["name"]}','#{"image_url"}','#{"description"}');"

  run_sql(sql)

  redirect "/"

end

delete '/games/:id' do
  params ["id"]
  db = PG.connect(dbname: 'gameshareit')
  sql = "DELETE FROM games WHERE id = #{params["id"]};"
  db.exec(sql)
  db.close 

  redirect "/"
end


get '/games/:id/edit' do
  db = PG.connect(dbname: 'goodfoodhunting')
  sql = "SELECT * FROM games WHERE id = #{params['id']};"
  results = db.exec(sql)
  db.close

  erb :edit, locals: { dish: results[0]}
end

patch '/games/:id' do
  db = PG.connect(dbname: 'gameshareit')
  sql = "update games set name = '#{params["name"]}', image_url = '#{params["image_url"]}', details = '#{params["description"]}' where id = #{params["id"]};"

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

delete '/logout' do
  #destroy the session
  session[:user_id]=nil

  redirect '/login'
end 
