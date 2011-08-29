# RVM bootstrap
$:.unshift(File.expand_path("~/.rvm/lib"))
require 'rvm/capistrano'
set :rvm_ruby_string, '1.9.2'
# set :rvm_type, :user # uncomment if you use have rvm installed in user's home dir

# main details
set :application, "orvabud"
role :web, "orvabud.com"
role :app, "orvabud.com"
role :db,  "orvabud.com", :primary => true

# server details
default_run_options[:pty] = true  # Must be set for the password prompt from git to work

#ssh_options[:forward_agent] = true
set :deploy_to, "/var/www/orvabud"
set :deploy_via, :remote_cache
set :user, "dima"
set :use_sudo, false
#set :git_shallow_clone, 1
set :scm_verbose, true
set :keep_releases, 5

# repo details
set :scm, :git
#set :scm_username, "DimaSamodurov"
set :repository, "git@github.com:DimaSamodurov/orvabud.git"
set :branch, "master"
set :git_enable_submodules, 1
set :deploy_via, :remote_cache


# runtime dependencies
depend :remote, :gem, "bundler", ">=1.0.0"

# tasks
namespace :deploy do
  task :start, :roles => :app do
    run "sudo /etc/init.d/nginx start"
  end

  task :stop, :roles => :app do
    run "sudo /etc/init.d/nginx stop"
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Symlink shared resources on each release"
  task :symlink_shared, :roles => :app do
    run "ln -nfs #{shared_path}/db/production.sqlite3 #{release_path}/db/production.sqlite3"
    run "ln -nfs #{shared_path}/tmp/dragonfly #{release_path}/tmp/dragonfly"    
  end
end

after 'deploy:update_code', 'deploy:symlink_shared'

namespace :bundler do
  desc "Symlink bundled gems on each release"
  task :symlink_bundled_gems, :roles => :app do
    run "mkdir -p #{shared_path}/bundled_gems"
    run "ln -nfs #{shared_path}/bundled_gems #{release_path}/vendor/bundle"
  end

  desc "Install for production"
  task :install, :roles => :app do
    run "cd #{release_path} && bundle install"
  end

end

after 'deploy:update_code', 'bundler:symlink_bundled_gems'
after 'deploy:update_code', 'bundler:install'