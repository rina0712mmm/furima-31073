FactoryBot.define do
  factory :purchase_address do
    postal_code { '111-1111' }
    prefecture_id { 1 }
    city { 'aaa' }
    house_number { '11' }
    apartment { 'aa' }
    phone_number { '11111111111' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
