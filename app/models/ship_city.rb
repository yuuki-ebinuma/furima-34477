class Ship_City < ActiveHash::Bace
  self.data = [
    {},
    {}
  ]

  include ActiveHash::Associations
  has_many :products

end

