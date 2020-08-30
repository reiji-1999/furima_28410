class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  with_options presence: true do
    has_many :items
    has_many :managements
    validates :birthday
    validates :nickname, length: { maximum: 40 }
    validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'password Include both letters numbers.' }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }
    validates :name_reading_family_name, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' }
    validates :name_reading_first_name, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' }
  end
end
