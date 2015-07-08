require 'rails_helper'

describe 'Admin sign-in' do

  before :each do
    admin = FactoryGirl.create(:admin)
    admin.confirmed_at = Time.now
    admin.save

    visit new_user_session_path

    fill_in 'user_email', with: admin.email
    fill_in 'user_password', with: admin.password

    click_button 'Zaloguj się'
  end

  it 'shows message about correct sign-in' do
    expect(page).to have_content('Zostałeś zalogowany.')
  end

  it 'allows admin to create category' do
    visit new_admin_category_path
    fill_in 'category_name', with: Faker::Commerce.department
    click_button 'Zapisz'
    expect(page).to have_content('Kategoria dodana')
  end

  it 'allows admin to create type' do
    visit new_admin_gear_path
    fill_in 'gear_name', with: Faker::Commerce.department
    click_button 'Zapisz'
    expect(page).to have_content('Typ dodany')
  end

  it 'allows admin to create model' do
    gear=FactoryGirl.create(:gear)

    visit admin_gears_new_model_path
    fill_in 'gear_name', with: Faker::Commerce.department
    save_and_open_page
    click_button 'Zapisz'
    expect(page).to have_content('Model dodany')
  end  

end
