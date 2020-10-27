

def run_sql(sql)
    db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'gameshareit'})
    result = db.exec(sql)
    db.close
    return result
end

# def run_sql(sql)
#     db = PG.connect(dbname: 'gameshareit')
#     results= db.exec(sql)
#     db.close
#     return results
# end

def find_user_by_email(email)
    results = run_sql("select * from users where email = '#{email}';")
    return results[0]
end

def find_user_by_id(id)
    results = run_sql("select * from users where id = #{id};")
    return results[0]
end

def find_game_by_id(id)
    results = run_sql("select * from games where id = #{id};")
    return results[0]
end

def all_games()
    run_sql('select * from games;')
end

def delete_game_by_id(id)
    db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'gameshareit'})
    db.exec(sql)
    db.close
end
    