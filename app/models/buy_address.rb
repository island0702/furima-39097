class BuyAddress
  include ActiveModel::Model
  attr_accessor :item, :user, :post_code, :address, :building_name, :building_name, :telephone_number

  validates :prefecture_id, numericality: { other_than: 1 }

  with_options presence: true do
    validates :item
    validates :user
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :address
    validates :building_name
    validates :telephone_number, format: {with: /\A[0-9]{11}\z/ }
    validates :area_of_origin_id
  end

  def save
    buy = Buy.create(
      item_id: item_id, 
      user_id: user_id
    )

    Address.create(
      buy_id: buy.id,
      municipality: municipality, 
      area_of_origin_id: area_of_origin_id, 
      address: address, 
      post_code: post_code, 
      telephone_number: telephone_number, 
      building_name: building_name, 
    )
  end
end