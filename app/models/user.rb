class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_many :buyers

  validates :nickname,        presence: true

  with_options presence:true, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/} do
    validates :last_name
    validates :first_name
  end

  with_options presence:true, format: {with: /\A[ァ-ヶ一]+\z/} do
    validates :last_name_kana
    validates :first_name_kana
  end
  validates :birthday,        presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
  
end
