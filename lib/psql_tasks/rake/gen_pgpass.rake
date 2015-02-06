namespace :psql do
  desc "Generates ~/.pgpass file for psql authentication"
  task :gen_pgpass do
    config = PsqlTasks::Config

    fail "You must specify `host`!"     unless config.host
    fail "You must specify `database`!" unless config.database
    fail "You must specify `username`!" unless config.username
    fail "You must specify `password`!" unless config.password

    file_name = File.join(ENV["HOME"], ".pgpass")
    File.open(file_name, "a") do |file|
      file << "#{config.host}:#{config.port || 5432}:#{config.database}:#{config.username}:#{config.password}\n"
    end
    %x[chmod u-x,g-rwx,o-rwx #{file_name}]
  end
end
