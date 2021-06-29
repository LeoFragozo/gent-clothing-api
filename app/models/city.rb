# frozen_string_literal: true

class City < ApplicationRecord
 validates_presence_of :name, :state, :country
end
