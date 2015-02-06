namespace :psql do
  desc "Use ActiveRecord database configuration to use with psql tasks"
  task :activerecord_config, :db do |t, args|
    db = args[:db] || ActiveRecord::Tasks::DatabaseTasks.env
    ar = ActiveRecord::Base.configurations[db]
    fail "ActiveRecord adapter must be `postgresql`!" if ar["adapter"] != "postgresql"

    config = PsqlTasks::Config
    config.host     = ar["host"]     if ar.key? "host"
    config.port     = ar["port"]     if ar.key? "port"
    config.database = ar["database"] if ar.key? "database"
    config.username = ar["username"] if ar.key? "username"
    config.password = ar["password"] if ar.key? "password"
  end
end
