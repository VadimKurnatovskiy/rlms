class Teacher < ApplicationRecord
  devise :database_authenticatable,
         :lockable,
         :recoverable,
         :rememberable,
         :timeoutable,
         :trackable,
         :validatable,
         :confirmable,
         # :omniauthable,
         :registerable

  validates :first_name, :locale, :last_name, presence: true
  validates :locale, inclusion: { in: %w(en ru) }
  
  has_many :courses, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end
end
