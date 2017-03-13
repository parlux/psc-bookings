FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password "password"
    role "user"
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    email Faker::Internet.email
    password "password"
    role "admin"
  end
end
