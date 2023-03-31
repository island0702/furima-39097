FactoryBot.define do
  factory :item do
    name { '猫' }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    detail { '猫' }
    category_id {2}
    condition_id {2}
    shipping_cost_id {2}
    area_of_origin_id {2}
    estimated_sipping_date_id {2}
    selling_price { 300 }
    association :user
  end
end
