namespace :psql do
  desc "Use Sequel database configuration to use with psql tasks"
  task :sq_config, :server do |t, args|
    PsqlTasks::Config.sequel! args[:server]
  end
  task :sq_config => 'psql:init'
end
