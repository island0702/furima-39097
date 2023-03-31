class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references      :user,                          null: false, foreign_key: true
      t.integer         :category_id,                   null: false
      t.integer         :condition_id,                  null: false
      t.integer         :shipping_cost_id,              null: false
      t.integer         :area_of_origin_id,             null: false
      t.integer         :estimated_sipping_date_id,     null: false
      t.integer         :selling_price,                 null: false
      t.string          :name,                          null: false
      t.text            :detail,                        null: false
      t.timestamps
    end
  end
end
