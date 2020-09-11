class BuyerManagement
  include ActiveModel::Model
  attr_accessor :postalcode, :area_id, :city, :housenumber, :buildingname, :phonenumber, :token, :user_id, :item_id

  POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/

  with_options presence: true do
    validates :postalcode, format: { with: POSTAL_CODE_REGEX }
    validates :area_id, numericality: { other_than: 1 } 
    validates :city
    validates :housenumber
    validates :phonenumber, length: { maximum: 11, minimum: 10 }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    buyer = Buyer.create(postalcode: postalcode, area_id: area_id, city: city, housenumber: housenumber, buildingname: buildingname, phonenumber: phonenumber, management_id: management_id)
    Management.create(user_id: user_id, item_id: item_id)
  end
end