module MageRecord
  class Website < MagentoDatabase
    self.table_name = :core_website

    has_many :customers
    has_many :stores
  end
end
