class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :days

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :name, :description, :category_id, :status_id, :burden_id, :area_id, :days_id, :price, :image, presence: true

  validates :category_id, numericality: { other_than: 1 } 
  validates :status_id, numericality: { other_than: 1 } 
  validates :burden_id, numericality: { other_than: 1 } 
  validates :area_id, numericality: { other_than: 1 } 
  validates :days_id, numericality: { other_than: 1 } 

  belongs_to :user
  has_one :management
  has_one_attached :image
end
