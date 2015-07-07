require "rails_helper"

RSpec.describe OrderProduct, type: :model do
  it { should validate_presence_of(:product_id) }
  it { should validate_presence_of(:quantity) }
  it { should validate_presence_of(:product_name) }
  it { should validate_presence_of(:product_price) }
  it { should validate_presence_of(:order_id) }
end
