class BuyAddress
  include ActiveModel::Model
  attr_accessor :item_id,
                :user_id,
                :municapality,
                :area_of_origin_id,
                :address,
                :post_code,
                :telephone_number,
                :building_name,
                :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :municapality
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :address
    validates :telephone_number, format: { with: /\A[0-9]{10,11}\z/ }
    validates :area_of_origin_id, numericality: { other_than: 1, message: '選択' }
    validates :token
  end

  def save
    buy = Buy.create(
      item_id: item_id,
      user_id: user_id
    )

    Address.create(
      buy_id: buy.id,
      municapality: municapality,
      area_of_origin_id: area_of_origin_id,
      address: address,
      post_code: post_code,
      telephone_number: telephone_number,
      building_name: building_name
    )
  end
end
