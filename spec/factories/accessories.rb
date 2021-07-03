# frozen_string_literal: true

FactoryBot.define do
  factory :accessory do
    description { "Oxford shoes" }
    dresscode { "Business/Black Tie" }
    color { "Black" }
    user
  end
end
