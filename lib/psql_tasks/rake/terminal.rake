namespace :psql do
  desc "Opens psql terminal for specified database"
  task :terminal do
    sh PsqlTasks::Config.command_line
  end
end
