class User < ApplicationRecord
  has_many :tweets, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # def full_name
  # #"#{first-name} #{last_name}"
  # end 

end
