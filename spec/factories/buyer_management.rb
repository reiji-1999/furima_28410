FactoryBot.define do
  factory :buyer_management do
    postalcode          { "123-4567" }
    area_id             { 2 }
    city                { "横浜市" }
    housenumber         { "青山1-1-1" }
    buildingname        { "柳ビル103" }
    phonenumber         { "09012345678" }
    user_id             { 1 }
    item_id             { 1 }
  end
end
