class Order < ActiveRecord::Base
  before_validation :populate_company_data, on: :create
  before_validation :generate_access_token, on: :create
  
  has_many :order_products
  has_many :products, through: :order_products
  
  validates :company_first_name, :company_last_name, :company_street_name, :company_house_no,
    :company_zip_code, :company_city_name, :company_phone_no,
    :client_first_name, :client_last_name, :client_street_name, :client_house_no,
    :client_apartment_no, :client_zip_code, :client_city_name, :client_phone_no, :sum,
    presence: true
  
  COMPANY_FIRST_NAME = 'Krystyna'
  COMPANY_LAST_NAME = 'Pieróg'
  COMPANY_STREET_NAME = 'Piotrkowska'
  COMPANY_HOUSE_NO = '99'
  COMPANY_ZIP_CODE = '99-999'
  COMPANY_CITY_NAME = 'Łódź'
  COMPANY_PHONE_NO = '(22)999-999-999'
  COMPANY_NUMBER = '185-816-00-90'
  COMPANY_ACCOUNT_NO = '45 1090 7159 5086 9599 2059 3875 3725'
  COMPANY_BANK_NAME = 'NazwaBank'

  
  validates :client_apartment_no, numericality: { only_integer: true, :greater_than => 0}
  validates :client_last_name, length: { maximum: 40 }
  validates :client_first_name, length: { maximum: 40 }
  validates :client_street_name, length: { maximum: 80 }
  validates :client_city_name, length: { maximum: 80 }
  validates :client_house_no, format: { with: /\A(\d)((\w)|(\/))*\z/i }
  validates :client_phone_no, format: { with: /\A[0-9]{9}\z/ }
  

  def from_session(cart, order_id)
    cart.each do |t|
      product_id = t['id']
      quantity = t['quantity']
      product_name = Product.find_by(id: product_id).name
      product_price = Product.find_by(id: product_id).price
      order_product = OrderProduct.create(product_id: product_id, quantity: quantity, product_name: product_name, product_price: product_price, order_id: order_id)
    end
  end

  private
  
  def populate_company_data
    self.company_first_name = COMPANY_FIRST_NAME
    self.company_last_name = COMPANY_LAST_NAME
    self.company_street_name = COMPANY_STREET_NAME
    self.company_house_no = COMPANY_HOUSE_NO
    self.company_zip_code = COMPANY_ZIP_CODE
    self.company_city_name = COMPANY_CITY_NAME
    self.company_phone_no = COMPANY_PHONE_NO
    self.company_number = COMPANY_NUMBER
    self.company_account_no = COMPANY_ACCOUNT_NO
    self.company_bank_name = COMPANY_BANK_NAME
  end
  
  def generate_access_token
    self.access_token = SecureRandom.urlsafe_base64
  end
end
