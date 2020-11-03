class Listing < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :days_to_ship

  validates :category_id, :condition_id, :postage_id, :prefecture_id, :days_to_ship_id, numericality: { other_than: 0 }
end

