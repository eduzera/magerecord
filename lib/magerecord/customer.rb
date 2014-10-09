module MageRecord
  class Customer < EavRecord
    self.table_name = :customer_entity

    belongs_to :store
    belongs_to :website

    has_many :addresses, foreign_key: :parent_id
    has_many :orders

    def fullname
      firstname_sql = "SELECT entity_varchar.value "+
      "FROM customer_entity AS entity "+
      "LEFT JOIN eav_attribute AS ea ON entity.entity_type_id = ea.entity_type_id "+
      "LEFT JOIN customer_entity_varchar AS entity_varchar ON entity.entity_id = entity_varchar.entity_id "+
      "AND ea.attribute_id = entity_varchar.attribute_id "+
      "AND ea.backend_type =  'varchar' "+
      "WHERE ea.attribute_code =  'firstname' "+
      "AND entity.entity_id = #{self.id}"

      lastname_sql = "SELECT entity_varchar.value "+
      "FROM customer_entity AS entity "+
      "LEFT JOIN eav_attribute AS ea ON entity.entity_type_id = ea.entity_type_id "+
      "LEFT JOIN customer_entity_varchar AS entity_varchar ON entity.entity_id = entity_varchar.entity_id "+
      "AND ea.attribute_id = entity_varchar.attribute_id "+
      "AND ea.backend_type =  'varchar' "+
      "WHERE ea.attribute_code =  'lastname' "+
      "AND entity.entity_id = #{self.id}"
      
      firstname = self.class.connection.execute(firstname_sql).first
      lastname  = self.class.connection.execute(lastname_sql).first

      (firstname + lastname).join(' ')
    end

    def self.find_by_name(name)
      sql = "SELECT entity.entity_id , entity_varchar.value "+
      "FROM customer_entity AS entity "+
      "LEFT JOIN eav_attribute AS ea ON entity.entity_type_id = ea.entity_type_id "+
      "LEFT JOIN customer_entity_varchar AS entity_varchar ON entity.entity_id = entity_varchar.entity_id "+
      "AND ea.attribute_id = entity_varchar.attribute_id "+
      "AND ea.backend_type =  'varchar' "+
      "WHERE ea.attribute_code =  'firstname' "+
      "AND entity_varchar.value LIKE '%#{name}%'"

      self.connection.execute(sql).collect{|x| OpenStruct.new({id: x[0], fullname: Customer.find(x[0]).fullname})}
    end
  end
end

