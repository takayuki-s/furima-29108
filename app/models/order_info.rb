class OrderInfo
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_number, :prefecture_id, :municipalities, :address, :building, :tel, :order_id

  with_options presence: true do
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id
    validates :municipalities
    validates :address
    validates :tel, format: {with: /\A[0-9]+\z/}
  end

  def save
    Address.create(post_number: post_number, prefecture :prefecture, municipalities: municipalities, address: address, building: building, tel: tel)
    Order.create(user_id: user.id, order_id: order.id)
  end

end