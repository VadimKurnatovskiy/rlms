class Teacher < ApplicationRecord
  devise :database_authenticatable,
         :lockable,
         :recoverable,
         :rememberable,
         :timeoutable,
         :trackable,
         :validatable
         # :confirmable,
         # :omniauthable,
         # :registerable,

  validates :first_name, :last_name, presence: true

  has_many :courses, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end
end
