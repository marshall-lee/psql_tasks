load 'psql_tasks/rake/terminal.rake'
load 'psql_tasks/rake/gen_pgpass.rake'
load 'psql_tasks/rake/config.rake'
load 'psql_tasks/rake/activerecord_config.rake' if defined?(ActiveRecord)
load 'psql_tasks/rake/sequel_config.rake' if defined?(Sequel)
