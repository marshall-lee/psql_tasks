module PsqlTasks
  class << self
    def padrino?
      defined? PadrinoTasks
    end

    def activerecord?
      ar = defined? ActiveRecord
      ar || (padrino? && PadrinoTasks.load?(:activerecord, ar))
    end

    def sequel?
      sq = defined? Sequel
      sq || (padrino? && PadrinoTasks.load?(:sequel, sq))
    end
  end
end

require 'psql_tasks/config'
require 'psql_tasks/railtie' if defined? Rails::Railtie
