FactoryGirl.define do
  sequence :teacher_email do |n|
    "teacher_#{n}@example.com"
  end

  sequence :learner_email do |n|
    "learner_#{n}@example.com"
  end

  sequence :administrator_email do |n|
    "administrator_#{n}@example.com"
  end
end
