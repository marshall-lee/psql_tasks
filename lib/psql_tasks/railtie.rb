module PsqlTasks
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'psql_tasks/rake.rb'
    end
  end
end
