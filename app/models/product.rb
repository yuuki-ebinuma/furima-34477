class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_status
  belongs_to :ship_charge
  belongs_to :ship_city
  belongs_to :ship_date

  belongs_to :user
  has_one :buyer
  has_one_attached :image

  with_options presence:true do
    validates :product_name
    validates :product_description
    validates :category
    validates :product_status_id
    validates :ship_charge_id
    validates :ship_city_id
    validates :ship_date_id

  end

  with_options presence:true,format: {with: /^[0-9]+$/} do
    validates :amount_sold
  end

end
