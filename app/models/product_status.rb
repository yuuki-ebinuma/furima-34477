class Product_Status < ActiveHash::Bace
  self.data = [
    {},
    {}
  ]

  include ActiveHash::Associations
  has_many :products

end
