class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to_active_hash :prefecture
end
