class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id	
    validates :arrival_date_id
    validates :price, numericality: {greater_than_or_equal_to: 300,less_than_or_equal_to: 9_999_999}, format: { with: /\A[0-9]+\z/ }
    validates :user
  end

  belongs_to :user
  has_one_attached :image
end
