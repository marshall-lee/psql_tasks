namespace :psql do
  task :config do
    unless PsqlTasks::Config.database
      PsqlTasks::Config.try_all!
    end
  end
end
