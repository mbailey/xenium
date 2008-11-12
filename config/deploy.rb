require 'deprec'

role :dom0, 'bb'

task :push do
  `rsync -avz --delete ./ bb:/opt/apps/xenium/manual`
end 

task :archive, :roles => :dom0 do
  host = Capistrano::CLI.ui.ask "Enter host to archive"
  sudo "/usr/bin/xen-archive-image #{host}"
end

  
set :application, "xenium"
set :domain, "bb.deprecated.org"
set :repository,  "git://github.com/mbailey/xenium.git"
# set :gems_for_project, %w(dr_nic_magic_models swiftiply) # list of gems to be installed

# Update these if you're not running everything on one host.
role :app, domain
role :web, domain
role :db,  domain, :primary => true
role :scm, domain # used by deprec if you want to install subversion

# If you aren't deploying to /opt/apps/#{application} on the target
# servers (which is the deprec default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git

namespace :deploy do
  task :restart, :roles => :app, :except => { :no_release => true } do
    top.deprec.mongrel.restart
  end
end
