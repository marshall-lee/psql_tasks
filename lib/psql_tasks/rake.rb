require 'psql_tasks'

namespace :psql do
  task :init do
  end
end

load 'psql_tasks/rake/terminal.rake'
load 'psql_tasks/rake/gen_pgpass.rake'
load 'psql_tasks/rake/config.rake'
load 'psql_tasks/rake/activerecord_config.rake' if PsqlTasks.activerecord?
load 'psql_tasks/rake/sequel_config.rake' if PsqlTasks.sequel?

if PsqlTasks.padrino?
  task 'psql:init' => :environment
end

if PsqlTasks.activerecord?
  task 'psql:init' => 'db:load_config'
end
