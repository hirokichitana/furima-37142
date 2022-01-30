FactoryBot.define do
  factory :user do
    gimei = Gimei.name

    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    lastname_em           {gimei.last.kanji}
    firstname_em          {gimei.first.kanji}
    lastname_katakana     {gimei.last.katakana}
    firstname_katakana    {gimei.first.katakana}
    birth_date            {Faker::Date.between(from: '1930-01-01', to: '2017-12-31')}
  end
end