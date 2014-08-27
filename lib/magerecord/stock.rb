module MageRecord
  class Stock < MagentoDatabase
    self.table_name = :cataloginventory_stock_item

    belongs_to :product
  end
end
