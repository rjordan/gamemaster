set :repository, "http://penguin-games.com/svn/gamemaster/release"
set :deploy_to, "/home/rjordan/rails_app/gamemaster"
role :web, "gamemaster.penguin-games.com"
role :app, "penguin-games.com"
role :db, "penguin-games.com", :primary => true
