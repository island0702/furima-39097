class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string                    :municapality,         null: false
      t.string                    :address,              null: false
      t.integer                   :area_of_origin_id,    null: false
      t.string                    :telephone_number,     null: false
      t.string                    :building_name
      t.string                    :post_code,            null: false
      t.references                :buy,                  null: false,  foreign_key: true
      t.timestamps
    end
  end
end
