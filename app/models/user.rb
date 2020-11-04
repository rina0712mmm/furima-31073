class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  with_options presence: true do
    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
    NAME_REGEX_KANA = /\A[ァ-ヶー－]+\z/.freeze

    validates :first_name, format: { with: NAME_REGEX }
    validates :last_name, format: { with: NAME_REGEX }
    validates :first_name_kana, format: { with: NAME_REGEX_KANA }
    validates :last_name_kana, format: { with: NAME_REGEX_KANA }
    validates :nickname
    validates :birth_date
  end
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
end
