class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :days_to_ship
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :status

  validates :name, :detail, :image, presence: true
  validates :price, presence: true, :numericality => { :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999}, format: { with: /\A[0-9]+\z/ }
  validates :category_id, :days_to_ship_id, :delivery_charge_id, :shipment_source_id, :status_id, presence: :true

end
