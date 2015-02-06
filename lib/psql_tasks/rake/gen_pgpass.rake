namespace :psql do
  desc "Generates ~/.pgpass file for psql authentication"
  task :gen_pgpass do
    PsqlTasks::Config.use do
      fail "You must specify `host`!"     unless host
      fail "You must specify `database`!" unless database
      fail "You must specify `username`!" unless username
      fail "You must specify `password`!" unless password

      file_name = File.join(ENV["HOME"], ".pgpass")
      File.open(file_name, "a") do |file|
        file << "#{host}:#{port || 5432}:#{database}:#{username}:#{password}\n"
      end
      %x[chmod u-x,g-rwx,o-rwx #{file_name}]
    end
  end
end
