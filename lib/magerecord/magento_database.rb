module MageRecord
  class MagentoDatabase < ActiveRecord::Base
    self.abstract_class = true

    def self.connect(options={})
      MageRecord::MagentoDatabase.establish_connection(
        adapter: options[:adapter],
        host: options[:host],
        database: options[:database],
        username: options[:username],
        password: options[:password],
        secure_auth: options[:secure_auth]
      )
    end
  end
end