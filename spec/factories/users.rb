FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 4, mix_case: false) }
    password_confirmation { password }
    last_name { '増田' }
    first_name { '太郎' }
    last_name_kana { 'マスダ' }
    first_name_kana { 'タロウ' }
    birth_date { Faker::Date.between(from: '1930-01-01', to: '2017-12-31') }
  end
end
