class Profile < ActiveRecord::Base
  belongs_to :user, dependent: :destroy

  validates :user_id, :first_name, :last_name, :street_name, :house_no, :zip_code, :city_name, :phone_no, 
    presence: true
  validates :apartment_no, numericality: { only_integer: true, :greater_than => 0 }
  validates :first_name, :last_name, length: { maximum: 40 }
  validates :street_name, :city_name, length: { maximum: 80 }
  validates :house_no, format: { with: /\A(\d)((\w)|(\/))*\z/i }
  validates :phone_no, format: { with: /\A[0-9]{9}\z/ }
end
