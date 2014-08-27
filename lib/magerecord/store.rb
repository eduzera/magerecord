module MageRecord
  class Store < MagentoDatabase # also known as Store View in Magento
    self.table_name = :core_store

    belongs_to :website

    has_many :customers
  end
end
