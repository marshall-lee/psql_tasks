namespace :psql do
  desc "Use Sequel database configuration to use with psql tasks"
  task :sequel_config, :server do |t, args|
    PsqlTasks::Config.sequel! args[:server]
  end
  task :sequel_config => 'psql:init'
end
