class BuyerManagement
  include ActiveModel::Model
  attr_accessor :postalcode, :area_id, :city, :housenumber, :buildingname, :phonenumber, :user_id, :item_id

  with_options presence: true do
    validates :postalcode, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :area_id, numericality: { other_than: 1 } 
    validates :city
    validates :housenumber
    validates :phonenumber, length: { maximum: 11, minimum: 10 }
    validates :user_id
    validates :item_id
  end

  def save
    buyer = Buyer.create(postalcode: postalcode, area_id: area_id, city: city, housenumber: housenumber, buildingname: buildingname, phonenumber: phonenumber)
    Management.create(user_id: user_id, item_id: item_id)
  end
end