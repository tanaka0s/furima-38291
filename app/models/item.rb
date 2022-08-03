class Item < ApplicationRecord
  belongs_to       :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :shipping_day

  with_options presence: true do
    validates :name
    validates :description
    validates :image
    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'is invalid.Input half-width characters' } 
  end
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'is out of setting range'}
  with_options numericality: { other_than: 1, message: "can't be blank"} do
    validates :category_id 
    validates :condition_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :shipping_day_id
  end
end
