FactoryBot.define do
  factory :item do
    item_name { 'aaa' }
    item_detail { 'bbb' }
    category_id { 1 }
    condition_id { 1 }
    postage_id { 1 }
    prefecture_id { 1 }
    days_to_ship_id { 1 }
    price { 500 }
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
