FactoryBot.define do
  factory :buy_address do
    address { '青山' }
    municapality { '渋谷区' }
    post_code { '111-1111' }
    telephone_number { '09011111111' }
    area_of_origin_id { 2 }
    building_name {'ペンション中村'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
