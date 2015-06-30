class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :confirmable

  has_one :profile

  validates :encrypted_password, :email, presence: {message: '- nie wypełniono wymaganego pola'}
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: '- niewłaściwy format'}
  validates :email, uniqueness: {message: '- już istnieje użytkownik o takim adresie'}
 end
