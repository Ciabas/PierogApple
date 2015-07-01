class Profile < ActiveRecord::Base
  belongs_to :user, dependent: :destroy

  validates :user_id, :first_name, :last_name, :street_name, :house_no, :apartment_no, :zip_code, :city_name, :phone_no, 
    presence: {message: '- nie wypełniono wymaganego pola'}
  validates :apartment_no, numericality: { only_integer: true, :greater_than => 0 , message: '- niewłaściwy format'}
  validates :last_name, length: { maximum: 40 , message: 'dłuższe niż 40 znaków'}
  validates :first_name, length: { maximum: 40 , message: 'dłuższe niż 40 znaków'}
  validates :street_name, length: { maximum: 80 , message: 'dłuższa niż 80 znaków'}
  validates :city_name, length: { maximum: 80 , message: 'dłuższa niż 80 znaków'}
  validates :house_no, format: { with: /\A(\d)((\w)|(\/))*\z/i , message: '- niewłaściwy format'}
  validates :phone_no, format: { with: /\A[0-9]{9}\z/ , message: '- niewłaściwy format'}
end
