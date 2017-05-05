FactoryGirl.define do
  factory :chuck_norris do
    kungfu { {fact: Faker::ChuckNorris.fact, knockouts: rand(0..20)}}
  end
end
