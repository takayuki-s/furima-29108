class OrderInfo
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_number, :prefecture_id, :municipalities, :address, :building, :tel, :token

  with_options presence: true do
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id
    validates :municipalities
    validates :address
    validates :tel, format: {with: /\A[0-9]+\z/}
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building: building, tel: tel, order_id: order.id)
  end

end