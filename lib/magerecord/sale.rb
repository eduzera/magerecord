module MageRecord
  class Sale < MagentoDatabase
    self.table_name = :sales_flat_invoice_grid

    belongs_to :order
  end
end