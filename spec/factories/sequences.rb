FactoryGirl.define do
  sequence :teacher_email do |n|
    "teacher_#{n}@example.com"
  end
end
