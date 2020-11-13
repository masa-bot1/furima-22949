FactoryBot.define do
  factory :user_purchase do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    street_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { 99012345678 }
    token {"tok_abcdefghijk00000000000000000"}
  end
end