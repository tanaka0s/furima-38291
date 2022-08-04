class OrderPurchaser
  include ActiveModel::Model
  attr_accessor :use_id,:item_id,:post_code,:prefecture_id,:city,:house_number,:building,:phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :city
    validates :house_number
    validates :phone_number,length: {minimum: 10, maximum: 11, message: "is too short"}
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
  end
  validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid. Input only number"}
  validates :prefecture, numericality: {other_than: 1, message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Purchaser.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, order_id: order.id)
  end
end