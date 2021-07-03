# frozen_string_literal: true

FactoryBot.define do
  factory :clothing do
    description { "Oxford Shirt" }
    dresscode { "Business Casual" }
    color { "White" }
    user
  end
end
