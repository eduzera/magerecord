module MageRecord
  class Order < MagentoDatabase
    self.table_name = :sales_flat_order

    has_one :sale
    # ignore canceled orders
    default_scope { where status: [:processing, :complete] }

    scope :only_complete, -> {where status: [:complete]}

    belongs_to :customer

    has_one :billing_address, -> { where address_type: 'billing' }, class_name: :OrderAddress, foreign_key: :parent_id
    has_one :shipping_address, -> { where address_type: 'shipping' }, class_name: :OrderAddress, foreign_key: :parent_id

    has_many :items, class_name: :OrderItem
    has_many :products, through: :items
    has_many :bills
  end
end
