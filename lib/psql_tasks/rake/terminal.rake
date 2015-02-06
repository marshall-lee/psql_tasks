namespace :psql do
  desc "Opens psql terminal for specified database"
  task :terminal => 'psql:config' do
    sh PsqlTasks::Config.command_line
  end
end
