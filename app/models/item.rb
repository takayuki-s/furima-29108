class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :days_to_ship, :delivery_charge, :shipment_source, :status

  validates :name, :detail, :price, presemce: true

  validates :category_id, :days_to_ship_id, :delivery_char_id, :shipment_source_id, :status_id, numericality: { other_than: 1 } 

end
