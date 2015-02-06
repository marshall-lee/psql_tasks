module PsqlTasks
  module Config
    class << self
      attr_accessor :host,
                    :port,
                    :database,
                    :username,
                    :password
    end

    def self.command_line
      cmd = "psql"
      cmd << " -h #{host}" if host
      cmd << " -p #{port}" if port
      cmd << " -U #{username}" if username
      if database
        cmd << " -d #{database}"
      else
        fail "Database must be set!"
      end
      return cmd
    end

    def self.activerecord!(db=nil)
      db ||= ActiveRecord::Tasks::DatabaseTasks.env
      ar = ActiveRecord::Base.configurations[db]
      fail "ActiveRecord adapter must be `postgresql`!" if ar["adapter"] != "postgresql"

      self.host     = ar["host"]     if ar.key? "host"
      self.port     = ar["port"]     if ar.key? "port"
      self.database = ar["database"] if ar.key? "database"
      self.username = ar["username"] if ar.key? "username"
      self.password = ar["password"] if ar.key? "password"
    end

    def self.sequel!(server=:default)
      sq = Sequel::Model.db.send(:server_opts, server)
      fail "Sequel adapter must be `postgres`!" if sq["adapter"] != "postgres"

      self.host     = sq["host"]     if sq.key? "host"
      self.port     = sq["port"]     if sq.key? "port"
      self.database = sq["database"] if sq.key? "database"
      self.username = sq["username"] if sq.key? "username"
      self.database = sq["password"] if sq.key? "password"
    end

    def self.try_all!
      if defined?(ActiveRecord)
        activerecord!
      elsif defined?(Sequel)
        sequel!
      end
    end

    def self.use(&blk)
      instance_eval(&blk)
    end
  end
end
