FactoryGirl.define do
  factory :user do
    email "user@test.com"
    password "password"
    role "user"
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    email "admin@test.com"
    password "password"
    role "admin"
  end
end
