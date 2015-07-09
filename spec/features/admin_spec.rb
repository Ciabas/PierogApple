require 'rails_helper'

describe 'Admin sign-in' do

  before :each do
    admin = FactoryGirl.create(:user, :admin, :confirmed)
    
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
    FactoryGirl.create(:gear)

    visit admin_gears_new_model_path
    fill_in 'gear_name', with: Faker::Commerce.department
    click_button 'Zapisz'
    expect(page).to have_content('Model dodany')
  end

  it 'allows admin to create product' do
    FactoryGirl.create(:category)
    
    gear = FactoryGirl.create(:gear)
    FactoryGirl.create(:gear, parent_id: gear.id)

    visit new_admin_product_path
    fill_in 'product_name', with: Faker::Commerce.department
    fill_in 'product_price', with: Faker::Commerce.price
    fill_in 'product_description', with: Faker::Lorem.paragraph
    attach_file 'product_product_images_attributes_0_photo', 'app/assets/images/test.jpg'
    # attach_file 'product_product_images_attributes_1_photo', 'app/assets/images/test.jpg'
    # attach_file 'product_product_images_attributes_2_photo', 'app/assets/images/test.jpg'
    click_button 'Zapisz'
    expect(page).to have_content('Produkt dodany')
  end

end
