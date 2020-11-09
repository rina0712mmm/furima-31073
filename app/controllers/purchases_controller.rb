class PurchaseController < ApplicationController
  def index
    @purchase = Item.includes(:item)
  end

  def create
    user = User.create(user_params)
    Address.create(address_params)
    Item.create(item_params(item))
  end
  
  provate

  def user_params
    params.permit(:nickname, :email, :encrypted_password, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_date)
  end

  def address_params
    params.permit(:postal_code, :prefecture, :city, :house_number, :apartment, :phone_number).merge(user_id: user.id)
  end

  def item_params(item)  
    params.permit(:item_name, :item_detail, :category_id, :condition_id, :postage_id, :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end