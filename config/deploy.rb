set :application, "gamemaster"
set :user, "rjordan"

set :scm, :git
set :branch, "master"
set :deploy_via, :checkout
set :git_shallow_clone, 1
set :runner, user
set :use_sudo, false
default_run_options[:pty]=true
set :repository, "git@penguin-games.com:#{application}.git"

task :stage do
  set :deploy_to, "/home/#{user}/rails/#{application}"
  role :web, "#{application}.penguin-games.com" # Your HTTP server, Apache/etc
  role :app, "#{application}.penguin-games.com" # This may be the same as your `Web` server
  role :db, "#{application}.penguin-games.com", :primary => true # This is where Rails migrations will run
end

task :production do
end

after 'deploy:symlink', 'deploy:finishing_touches'

namespace :deploy do
  task :finishing_touches, :roles => :app do
    run "cp -pf #{deploy_to}/shared/database.yml #{current_path}/config/database.yml"
  end
#  task :start {}
#  task :stop {}
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path, 'tmp', 'restart.txt')}"
  end
end
