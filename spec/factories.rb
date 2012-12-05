FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com" }   
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
    	admin true
    end
  end

  factory :ingredient do
  	sequence(:name)	{ |n| "Ingredient #{n}" }
  	sequence(:substitution) { |n| "Substitution #{n}" }
  end

  factory :recipe do
  	sequence(:title)	{ |n| "Recipe #{n}" }
  	sequence(:source) { |n| "Source #{n}" }
  	uploaded_user 1
  end

  factory :step do
  	sequence(:number) { |n| n }
  	sequence(:instructions)	{ |n| "This is step number #{n}." }
  end
end
