namespace :carrierwave do
  
  desc "Create the symlink for the carrierwave uploads folder"
  task :symlink, roles: :app do
    puts "Carrierwave symlinks ..."
    run "rm -rf #{release_path}/public/uploads"
    run "ln -nfs #{shared_path}/system/uploads/ #{release_path}/public/uploads"
  end
    
end