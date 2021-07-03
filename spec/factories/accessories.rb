FactoryBot.define do
  factory :accessory do
    description { "Oxford shoes" }
    dresscode { "Business/Black Tie" }
    color { "Black" }
    user { accessory.user.id }
  end
end
