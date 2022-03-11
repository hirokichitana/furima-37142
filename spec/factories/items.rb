FactoryBot.define do
  factory :item do
    title              { Faker::Lorem.word }
    explanation        { Faker::Lorem.sentence }
    category_id        { Faker::Number.within(range: 2..11) }
    condition_id       { Faker::Number.within(range: 2..7) }
    delivery_fee_id    { Faker::Number.within(range: 2..3) }
    prefecture_id      { Faker::Number.within(range: 2..48) }
    lead_time_id       { Faker::Number.within(range: 2..4) }
    price              { Faker::Number.within(range: 300..9_999_999) }
    association :user

    after(:build) do |item|
      item.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
