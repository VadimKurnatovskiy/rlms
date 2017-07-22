class Teacher < ApplicationRecord
  devise :confirmable,
         :database_authenticatable,
         :lockable,
         # :omniauthable,
         :recoverable,
         :registerable,
         :rememberable,
         :timeoutable,
         :trackable,
         :validatable

  validates :first_name, :last_name, presence: true
end
