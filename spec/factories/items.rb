FactoryBot.define do
  factory :item do
    name          { "aaa" }
    description   { "aaa" }
    category_id   { 2 }
    status_id     { 2 }
    burden_id     { 2 }
    area_id       { 2 }
    days_id       { 2 }
    price         { 2222 }
    image         {""}
  end
end
