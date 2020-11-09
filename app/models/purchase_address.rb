class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :apartment, :phone_number, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :house_number
    validates :phone_number, format: {with: /\A\d{1,11}\z/}
  end

  validates :prefecture_id, numericality: { other_than: 0 }

  def save
    item = Iten.find(item_id)
    user = item.user
    purchase = Purchase.create(user_id: user.id, item_id: item.id, token:token)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city,
                    house_number: house_number, apartment: apartment, phone_number: phone_number, purchase_id: purchase.id )
    end
  end
