namespace :psql do
  task :terminal do
    sh PsqlTasks::Config.command_line
  end
end
