namespace :psql do
  desc "Use ActiveRecord database configuration to use with psql tasks"
  task :ar_config, :db do |t, args|
    PsqlTasks::Config.activerecord! args[:db]
  end
  task :ar_config => 'psql:init'
end
