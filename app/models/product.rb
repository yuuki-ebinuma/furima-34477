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
    validates :category_id
    validates :product_status_id
    validates :ship_charge_id
    validates :ship_city_id
    validates :ship_date_id
    validates :image
    validates :amount_sold
  end
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :product_status_id
    validates :ship_charge_id
    validates :ship_city_id
    validates :ship_date_id
  end

    validates :amount_sold, numericality: { with: /\A[0-9]+\z/, message: 'Invalid value'}

    validates :amount_sold, numericality: { greater_than_or_equal_to: 300 ,less_than_or_equal_to: 9999999}

end
