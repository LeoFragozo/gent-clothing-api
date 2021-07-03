class Accessory < ApplicationRecord
  belongs_to :user
  validates_presence_of :description, :dresscode, :color
end
