set :application, "blueprint"
set :user, "deploy"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache

set :scm, :git
set :repository,  "git@github.com:mvaneyken/#{application}.git"
set :branch, 'master' unless exists?(:branch)

server "97.107.132.230", :web, :app, :db, primary: true

default_run_options[:pty] = true
set :use_sudo, false
set :ssh_options, { :forward_agent => true }

# Capistrano 2.x Default Deployment Behaviour
# -------------------------------------------
load "config/recipes/carrierwave"
load "config/recipes/linode"

# 1 deploy:setup
after "deploy:setup", "linode:setup_config"
after "deploy:setup", "linode:setup_uploads"
# 2 deploy:default
# 3 deploy:update
# 3.1 deploy:update_code
# 3.2 deploy:finalize_update
after "deploy:finalize_update", "carrierwave:symlink"
after "deploy:finalize_update", "linode:symlink_config"
# 3.3 deploy:symlink
after "deploy:create_symlink", "linode:assets_precompile"
# 4 deploy:restart
after "deploy:restart", "deploy:cleanup"

namespace :deploy do

  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
  end

end