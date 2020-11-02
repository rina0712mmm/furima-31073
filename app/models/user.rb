class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :items
         has_many :purchases

         with_options presence: true do
           validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
           validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
           validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
           validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
           validates :nickname
           validates :birth_date
         end
          validates :email, uniqueness: { case_sensitive: false }
          validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
       end
