FactoryBot.define do
  factory :purchase_delivery_address do
    postal_code         { '123-4567' }
    prefecture_id       { Faker::Number.within(range: 2..48) }
    municipalities      { Faker::Address.city }
    house_number        { Faker::Address.street_address }
    building_name       { 'ハイツ' }
    telephone_number    { Faker::Number.number(digits: 11) }
    token               { 'tok_abcdefghijk00000000000000000' }
  end
end
