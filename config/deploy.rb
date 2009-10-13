task :procs, :hosts=>"penguin-games.com" do
  run "ps -A"
end

set :default_stage, "staging"
set :stages, %w(staging production)
require 'capistrano/ext/multistage'

set :application, "GameMaster"
set :scm, :subversion
set :user, "rjordan"


