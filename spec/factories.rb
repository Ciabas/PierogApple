FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password Faker::Internet.password

    trait :admin do
      is_admin true
    end

    trait :confirmed do
      confirmed_at Time.now
    end
  end

  factory :gear do
    name Faker::Commerce.department

    factory :model do
      @gear = FactoryGirl.create(:gear)
      parent_id @gear.id
    end
  end

  factory :category do
    name Faker::Commerce.department
  end

  factory :profile do
    # untested - we'll see soon
    user
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    phone_no Faker::Number.number(9)
    street_name Faker::Address.street_name
    house_no Faker::Address.building_number
    zip_code '90-210'
    city_name Faker::Address.city
    apartment_no Faker::Number.number(2)
  end




  factory :product do
    category
    model
    name Faker::Commerce.department
    price Faker::Commerce.price
    description Faker::Lorem.paragraph
    status 'dostepny'
  end

  factory :product_image do
    product
    photo Faker::Avatar.image
  end
end
