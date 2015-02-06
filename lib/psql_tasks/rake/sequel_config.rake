namespace :psql do
  desc "Use Sequel database configuration to use with psql tasks"
  task :sequel_config, :server do |t, args|
    server = args[:server] || :default
    sq = Sequel::Model.db.send(:server_opts, server)
    fail "Sequel adapter must be `postgres`!" if sq["adapter"] != "postgres"

    config = PsqlTasks::Config
    config.host     = sq["host"]     if sq.key? "host"
    config.port     = sq["port"]     if sq.key? "port"
    config.database = sq["database"] if sq.key? "database"
    config.username = sq["username"] if sq.key? "username"
    config.database = sq["password"] if sq.key? "password"
  end
end
