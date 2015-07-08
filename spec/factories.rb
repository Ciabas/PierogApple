FactoryGirl.define do
  factory :admin, class: User do
    email Faker::Internet.email
    password Faker::Internet.password
    is_admin true
  end

  factory :user do
    @email = Faker::Internet.email
    @password = Faker::Internet.password
    email @email
    password @password
  end

  factory :gear do
    name Faker::Commerce.department
  end

end
