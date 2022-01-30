FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6, mix_case: false)}
    password_confirmation {password}
    lastname_em           {'田中'}
    firstname_em          {'太郎'}
    lastname_katakana     {'タナカ'}
    firstname_katakana    {'タロウ'}
    birth_date            {Faker::Date.between(from: '1930-01-01', to: '2017-12-31')}
  end
end