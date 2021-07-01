FactoryBot.define do
  factory :clothing do
    description { "Oxford Shirt" }
    dresscode { "Business Casual" }
    color { "White" }
    user { clothing.user.id }
  end
end
