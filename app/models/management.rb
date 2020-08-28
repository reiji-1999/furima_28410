class Management < ApplicationRecord
  has_one :buyer
  belongs_to :user
  belongs_to :item
end
