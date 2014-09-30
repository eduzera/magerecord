module MageRecord
  class Bill < MagentoDatabase
    self.table_name = :sales_flat_invoice

    belongs_to :order
  end
end