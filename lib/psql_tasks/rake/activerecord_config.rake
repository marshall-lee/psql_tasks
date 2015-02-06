namespace :psql do
  desc "Use ActiveRecord database configuration to use with psql tasks"
  task :activerecord_config, :db do |t, args|
    PsqlTasks::Config.activerecord! args[:db]
  end
end
