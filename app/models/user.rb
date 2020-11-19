class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true
    validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
    validates :family_name, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :kana_family, format: {with: /\A[ァ-ン一]+\z/}
    validates :kana_first, format: {with: /\A[ァ-ン一]+\z/}
    validates :birthday
  end

  has_many:items
end
