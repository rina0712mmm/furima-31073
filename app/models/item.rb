class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_to_ship

  validates :category_id, :condition_id, :postage_id, :prefecture_id, :days_to_ship_id, numericality: { other_than: 0 }
end
