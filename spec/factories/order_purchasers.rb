FactoryBot.define do
  factory :order_purchaser do
    post_code     { '123-1234' }
    prefecture_id { 2 }
    city          { 'Sapporo' }
    house_number  { '1-2' }
    building      { 'apartment' }
    phone_number  { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
