namespace :linode do

  desc "setup the nginx, unicorn and settings configuration files"
  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
    run "mkdir -p #{shared_path}/config/settings"
    put File.read("config/settings.yml"), "#{shared_path}/config/settings.yml"
    put File.read("config/settings.local.yml"), "#{shared_path}/config/settings.local.yml"
    put File.read("config/settings/production.yml"), "#{shared_path}/config/settings/production.yml"
    put File.read("config/settings/production.local.yml"), "#{shared_path}/config/settings/production.local.yml"
    puts "Now edit the config files in #{shared_path}."
  end

  desc "setup the upload's folder"
  task :setup_uploads, roles: :app do
    sudo "ln -s #{shared_path}/system/upload upload"
  end
  
  desc "setup the database.yml link"
  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

  desc "Precompile assets locally"
  task :assets_precompile, :roles => :app, :except => { :no_release => true } do
    run_locally("bundle exec rake assets:clean && bundle exec rake assets:precompile")
    upload("public/assets", "#{release_path}/public/assets", {:via => :scp, :recursive => true})
    run_locally("bundle exec rake assets:clean")
  end

end
