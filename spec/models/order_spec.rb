require 'rails_helper'

RSpec.describe Order, :type => :model do
  it { should have_many(:order_products) }
  it { should have_many(:products).through(:order_products) }
  it { should validate_presence_of(:company_first_name) }
  it { should validate_presence_of(:company_first_name) }
  it { should validate_presence_of(:company_street_name) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:name) }
end
