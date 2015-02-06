module PsqlTasks
end

require 'psql_tasks/config'
require 'psql_tasks/railtie' if defined? Rails::Railtie
