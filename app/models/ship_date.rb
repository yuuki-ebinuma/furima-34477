class Ship_Date < ActiveHash::Bace
  self.data = [
    {},
    {}
  ]

  include ActiveHash::Associations
  has_many :products

end

