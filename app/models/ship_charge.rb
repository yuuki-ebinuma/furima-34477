class Ship_Charge < ActiveHash::Bace
  self.data = [
    {},
    {}
  ]

  include ActiveHash::Associations
  has_many :products

end
