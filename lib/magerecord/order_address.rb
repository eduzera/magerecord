module MageRecord
  class OrderAddress < MagentoDatabase
    self.table_name = :sales_flat_order_address

    belongs_to :order, foreign_key: :parent_id
  end
end
