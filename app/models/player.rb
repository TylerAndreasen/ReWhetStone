class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :username, uniqueness: true
         # All other fields are handled by devise or are not required
         # NOTE:: This may need to look more like examples, as I may need to
         # allow Round and or Mentorship data through as well. 
end
# temporary