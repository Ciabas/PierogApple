require 'rails_helper'
RSpec.describe Product, type: :model do
  it { should belong_to(:gear) }
  it { should belong_to(:category) }
  it { should have_many(:product_images) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:price) }
  it { should accept_nested_attributes_for(:product_images) }

  describe 'price validation' do
    it do
      should allow_value('24.55').for(:price)
      should allow_value('24.5').for(:price)
      should allow_value('24').for(:price)
      should_not allow_value('24.').for(:price)
      should_not allow_value('42.445').for(:price)
      should_not allow_value('abs').for(:price)
      should_not allow_value('$#.34').for(:price)
      should_not allow_value('-20').for(:price)
      should_not allow_value('-2.20').for(:price)
    end
  end
end
