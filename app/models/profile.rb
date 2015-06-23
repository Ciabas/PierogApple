class Profile < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :first_name, :last_name, :street_name, :house_no, :apartment_no, :zip_code, :city_name, 
    presence: true
  validates :apartment_no, numericality: { only_integer: true, :greater_than => 0 }
  validates :first_name, :last_name, length: { maximum: 40 }
  validates :street_name, :city_name, length: { maximum: 80 }
  validates :house_no, format: { with: /\A(\d)((\w)|(\/))*\z/i }
end
