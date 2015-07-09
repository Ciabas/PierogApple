require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should have_many(:order_products) }
  it { should have_many(:products).through(:order_products) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:client_first_name) }
  it { should validate_length_of(:client_first_name).is_at_most(40) }
  it { should validate_presence_of(:client_last_name) }
  it { should validate_length_of(:client_last_name).is_at_most(40) }
  it { should validate_presence_of(:client_street_name) }
  it { should validate_length_of(:client_street_name).is_at_most(80) }
  it { should validate_presence_of(:client_house_no) }
  it { should validate_presence_of(:client_zip_code) }
  it { should validate_presence_of(:client_city_name) }
  it { should validate_length_of(:client_city_name).is_at_most(80) }
  it { should validate_presence_of(:client_phone_no) }
  it { should validate_presence_of(:client_email) }
  it { should validate_presence_of(:sum) }

  it do
    should allow_value('32/34', '888a', '95', '44444F', '12/190').for(:client_house_no)
    should_not allow_value('w', 'w2', '/').for(:client_house_no)
    should allow_value('987654321').for(:client_phone_no)
    should_not allow_value('56783492').for(:client_phone_no)
    should allow_value('91-496').for(:client_zip_code)
    should_not allow_value('0-034', '00000').for(:client_zip_code)
    should allow_value('wp_pw@oko.pl').for(:client_email)
    should_not allow_value('wp_pw.oko.pl').for(:client_email)
  end

  it 'should have company data modules' do
    Order::COMPANY_CITY_NAME.should_not eq nil
    Order::COMPANY_FIRST_NAME.should_not eq nil
    Order::COMPANY_HOUSE_NO.should_not eq nil
    Order::COMPANY_LAST_NAME.should_not eq nil
    Order::COMPANY_PHONE_NO.should_not eq nil
    Order::COMPANY_STREET_NAME.should_not eq nil
    Order::COMPANY_ZIP_CODE.should_not eq nil
    Order::COMPANY_ACCOUNT_NO.should_not eq nil
    Order::COMPANY_NUMBER.should_not eq nil
    Order::COMPANY_BANK_NAME.should_not eq nil
  end

  describe 'populate_company_data' do
    it 'should add to an object company data before validation' do
      order = Order.new
      order.validate
      order.company_first_name.should eq Order::COMPANY_FIRST_NAME
      order.company_last_name.should eq Order::COMPANY_LAST_NAME
      order.company_street_name.should eq Order::COMPANY_STREET_NAME
      order.company_house_no.should eq Order::COMPANY_HOUSE_NO
      order.company_zip_code.should eq Order::COMPANY_ZIP_CODE
      order.company_city_name.should eq Order::COMPANY_CITY_NAME
      order.company_phone_no.should eq Order::COMPANY_PHONE_NO
      order.company_account_no.should eq Order::COMPANY_ACCOUNT_NO
      order.company_bank_name.should eq Order::COMPANY_BANK_NAME
      order.company_number.should eq Order::COMPANY_NUMBER
    end
  end

  describe 'company_data' do
    it 'should create an array of company data' do
      arr = Order.company_data
      arr.should_not eq nil
    end
  end

  describe 'from_session' do
    it 'should create OrderProduct from cart' do
      expect(OrderProduct.exists?(order_id: 1)).to eq(false)
      product = Product.new(name: 'rondel', price: 20.00)
      product.save validate: false
      puts product.errors.full_messages
      cart = [{ id: product.id, quantity: 1 }]
      order = Order.create
      order.from_session(cart, 1)
      expect(OrderProduct.exists?(order_id: 1)).to eq(true)
    end
  end
end
