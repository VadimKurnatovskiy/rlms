FactoryGirl.define do
  factory :course do
    teacher
    title "My Course"
    slug "my-course"
    description "My Course description"
  end

  trait :published do
    published :true
  end
end
