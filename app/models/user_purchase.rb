class UserPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street_number, :building_name, :phone_number, :user_id, :item_id, :purchase_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :street_number
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 0 }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street_number: street_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
