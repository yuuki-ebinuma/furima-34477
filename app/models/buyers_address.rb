class BuyersAddress
  include ActiveModel::Model
  attr_accessor :user_id,:product_id,:postal_code,:ship_region,:ship_address,:ship_city_id,:building,:phone,:buyer_id,:token
  

  with_options presence: true do
    validates :postal_code, format: {with:/\A[0-9]{3}-[0-9]{4}\z/}
    validates :ship_region
    validates :ship_address
    validates :ship_city_id 
    validates :phone, format: {with:/\A\d{11}\z/}
    validates :token
  end

  def save
    buyer = Buyer.create(user_id: user_id,product_id: product_id)
    Address.create(postal_code: postal_code,ship_region: ship_region,ship_address: ship_address,ship_city_id: ship_city_id,building: building,phone: phone,buyer_id: buyer.id)
  end
end