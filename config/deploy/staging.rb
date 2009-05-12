set :repository, "http://penguin-games.com/svn/gamemaster/trunk"
set :deploy_to, "/home/rjordan/rails_stage/gamemaster"
server "penguin-games.com", :app, :web, :db, :primary => true
