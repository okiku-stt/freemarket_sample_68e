require "capistrano/setup"
require "capistrano/deploy"
require 'capistrano/rbenv'
require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require 'capistrano3/unicorn'
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }

# Rake::Task[:production].reenable
# namespace :deploy do
#   task :restart_unicorn_twice? do
#     invoke 'deploy:restart_unicorn'
#     invoke 'deploy:restart_unicorn'
#   end

#   task :restart_unicorn_twice! do
#     invoke 'deploy:restart_unicorn'
#     Rake::Task['deploy:restart_unicorn'].reenable
#     invoke 'deploy:restart_unicorn'
#   end
# end