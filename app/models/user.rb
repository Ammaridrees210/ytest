class User < ApplicationRecord
  has_many :tweets, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
