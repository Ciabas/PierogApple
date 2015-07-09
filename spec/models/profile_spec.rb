require 'rails_helper'

RSpec.describe Profile, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:street_name) }
  it { should validate_presence_of(:house_no) }
  it { should validate_presence_of(:zip_code) }
  it { should validate_presence_of(:city_name) }
  it { should validate_length_of(:first_name).is_at_most(40) }
  it { should validate_length_of(:last_name).is_at_most(40) }
  it { should validate_length_of(:street_name).is_at_most(80) }
  it { should validate_length_of(:city_name).is_at_most(80) }

  it do
    should allow_value('32/34', '888a', '95', '44444F', '12/190').for(:house_no)
    should_not allow_value('w', 'w2', '/').for(:house_no)
  end
end
