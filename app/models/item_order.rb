class ItemOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :buillding, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code,        format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id,         numericality: { only_integer: true}
    validates :city,               format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :house_number
    validates :phone_number,       numericality: { only_integer: true }
  end
  # validates :buillding,          format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, buillding: buillding, phone_number: phone_number, order_id: order.id )
  end

end
