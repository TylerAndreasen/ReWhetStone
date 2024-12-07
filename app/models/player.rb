class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :round, dependent: :destroy

  accepts_nested_attributes_for :round

  validates :username, uniqueness: true, allow_blank: false, allow_nil: false

  # All other fields are handled by devise or are not required
  # NOTE:: This may need to allow data about a Mentorship, if I ever implement
  # such. 
end
# temporary