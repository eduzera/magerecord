module MageRecord
  class MagentoDatabase
    def initialize(options={})
      MageRecord::MagentoDatabase.establish_connection(
        adapter: options[:adapter],
        host: options[:host],
        database: options[:database],
        username: options[:username],
        password: options[:password],
        secure_auth: options[:secure_auth] || true
      )
    end
  end
end

