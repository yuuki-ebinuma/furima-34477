FactoryBot.define do
  factory :buyers_address do
    postal_code          { "123-4567" }
    ship_region          { 1 }
    ship_address         { "福岡市中央区"}
    ship_city_id         { "青山1-1-1" }
    phone                { "08039808767" }
  end
end