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

# samples for test on irb

# $LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
# require 'magerecord'

# MageRecord::MagentoDatabase.connect(adapter: 'mysql2', host: 'mysql02-farm19.uni5.net', database: 'pontafirme01', username: 'pontafirme01', password: 'moleque', secure_auth: false)
# orders = MageRecord::Order.all.order('created_at ASC').limit(10)