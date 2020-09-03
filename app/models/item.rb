class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :day

  validates :price, length: { minimum: 300, maximum: 9999999 }
  validates :name, :description, :category_id, :status_id, :burden_id, :area_id, :days_id, :price, :image, presence: true
  with_options presence: true do
    numericality: { other_than: 1 } 
  end

  belongs_to :user
  has_one :management
  has_one_attached :image
end
