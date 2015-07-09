FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    trait :admin do
      is_admin true
    end
    trait :confirmed do
      confirmed_at Time.now
    end
  end

  factory :gear do
    name { Faker::Commerce.department }
    factory :model do
      @gear = FactoryGirl.create(:gear)
      parent_id @gear.id
    end
  end

  factory :category do
    name { Faker::Commerce.department }
  end

  factory :profile do
    user
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone_no { Faker::Number.number(9) }
    street_name { Faker::Address.street_name }
    house_no { Faker::Address.building_number }
    zip_code '90-210'
    city_name { Faker::Address.city }
    apartment_no { Faker::Number.number(2) }
  end

  factory :product_image do
    photo { Faker::Avatar.image }
    product
  end

  factory :product do
    category
    association :gear, factory: :model
    name { Faker::Commerce.department }
    price { Faker::Commerce.price }
    description { Faker::Lorem.paragraph }
    status 'dostepny'
    trait :unavailable do
      status 'niedostepny'
    end
    trait :on_demand do
      status 'zamowienie'
    end
    transient do
      images_count 1
    end
    after :build do |product, evaluator|
      product.product_images << FactoryGirl.build_list(:product_image,
                                                        evaluator.images_count,
                                                        product: product)
    end
  end

  factory :slider_image do
    photo { Faker::Avatar.image }
    trait :titled do
      title { Faker::Commerce.department }
    end
    trait :captioned do
      caption { Faker::Lorem.paragraph }
    end
    trait :linked do
      link '/static_pages/contact'
    end
  end
end
