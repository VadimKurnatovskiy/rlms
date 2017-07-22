FactoryGirl.define do
  factory :teacher do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    email { generate(:teacher_email) }
    password "123456"
    password_confirmation "123456"

    confirmed_at Time.now
  end

  trait :not_confirmed do
    confirmed_at nil
  end
end
