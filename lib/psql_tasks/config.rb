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
      cmd << " -U #{username}" if username
      cmd << " -p #{port}" if port
      if database
        cmd << " -d #{database}"
      else
        fail "Database must be set!"
      end
      return cmd
    end
  end
end
