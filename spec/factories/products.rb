FactoryBot.define do
  factory :product do
    product_name            {'test'}
    product_description     {'test'}
    category_id             { 1 }
    product_status_id       { 1 }
    ship_charge_id          { 1 }
    ship_city_id            { 1 }
    ship_date_id            { 1 }
    amount_sold             { '3000' }
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
