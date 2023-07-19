FactoryBot.define do
  factory :tianyan do
    sequence(:name) { |n| "name#{n}" }
    # association_object
    # association :target, factory: :defined_factory_name
  end
end