require 'rails_helper'
describe 'User orders product' do
  before :each do
    user = FactoryGirl.create(:user, :confirmed)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Zaloguj się'
  end

  it 'shows message about correct sign-in' do
    expect(page).to have_content('Zostałeś zalogowany.')
  end

  it 'has submit button on product page' do
    product = FactoryGirl.create(:product)
    visit product_path(product.id)
    expect(page).to have_selector("input[type=submit]")
  end

  it 'adds 2 products to cart and orders it' do
    product = FactoryGirl.create(:product)
    visit product_path(product.id)
    fill_in 'quantity', with: 2
    click_on 'Dodaj'
    expect(page).to have_content('Produkt dodany')
    click_on 'Koszyk'
    expect(page).to have_content('Twój koszyk')
    expect(page).not_to have_content('Nie ma jeszcze żadnych produktów.')
    fill_in 'quantity', with: 3
    click_on 'Zmień'
    expect(page).to have_content('Produkt zmieniony.')
    click_on 'Przejdź do płatności'
    expect(page).to have_content('Dane kupującego')
    fill_in 'order_client_first_name', with: Faker::Name.first_name
    fill_in 'order_client_last_name', with: Faker::Name.last_name
    fill_in 'order_client_phone_no', with: Faker::Number.number(9)
    fill_in 'order_client_street_name', with: Faker::Address.street_name
    fill_in 'order_client_house_no', with: Faker::Address.building_number
    fill_in 'order_client_apartment_no', with: Faker::Number.number(2)
    fill_in 'order_client_zip_code', with: '90-210'
    fill_in 'order_client_city_name', with: Faker::Address.city
    fill_in 'order_client_email', with: Faker::Internet.email
    click_on 'Zamawiam!'
  end
end
