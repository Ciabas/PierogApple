require 'rails_helper'

RSpec.describe Gear, type: :model do
  it { should have_many(:products) }
  it { should validate_presence_of(:name) }

  describe 'base scope' do
    let!(:gear_base_one) { Gear.create(name: 'telefon') }
    let!(:gear_base_two) { Gear.create(name: 'tablet') }
    let!(:gear_another) { Gear.create(name: '11c', parent_id: gear_base_two.id) }
    let!(:gear_anotherone) { Gear.create(name: '5s', parent_id: gear_base_one.id) }

    it  do
      Gear.base.should eq [gear_base_one, gear_base_two]
      Gear.base.should_not eq [gear_another, gear_anotherone]
    end
  end

  describe 'notbase scope' do
    let!(:gear_base_one) { Gear.create(name: 'telefon') }
    let!(:gear_base_two) { Gear.create(name: 'tablet') }
    let!(:gear_another) { Gear.create(name: '11c', parent_id: gear_base_two.id) }
    let!(:gear_anotherone) { Gear.create(name: '5s', parent_id: gear_base_one.id) }

    it  do
      Gear.notbase.should_not eq [gear_base_one, gear_base_two]
      Gear.notbase.should eq [gear_another, gear_anotherone]
    end
  end

  describe 'parent' do
    let!(:gear_mom) { Gear.create(name: 'telefon') }
    let!(:gear_kid) { Gear.create(name: '5s', parent_id: gear_mom.id) }

    it  do
      gear_kid.parent.should eq gear_mom
    end
  end

  describe 'children' do
    let!(:gear_mom) { Gear.create(name: 'telefon') }
    let!(:gear_kid_adam) { Gear.create(name: '5s', parent_id: gear_mom.id) }
    let!(:gear_kid_basia) { Gear.create(name: '5c', parent_id: gear_mom.id) }

    it  do
      gear_mom.children.should eq [gear_kid_adam, gear_kid_basia]
    end
  end
end
