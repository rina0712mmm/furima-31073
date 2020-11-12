class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :apartment, :phone_number, :item_id, :token, :user_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{1,11}\z/ }
    validates :token
    validates :user_id
    validates :item_id
  end

  validates :prefecture_id, numericality: { other_than: 0 }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id, token: token)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city,
                   house_number: house_number, apartment: apartment, phone_number: phone_number, purchase_id: purchase.id)
  end
end
