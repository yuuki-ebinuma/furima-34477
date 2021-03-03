class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_many :buyers


  with_options presence:true, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/} do
    validates :last_name
    validates :first_name
  end

  with_options presence:true, format: {with: /\A[ァ-ヶ一]+\z/} do
    validates :last_name_kana
    validates :first_name_kana
  end


  with_options presence:true do
    validates :birthday
    validates :nickname
  end


  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

end
