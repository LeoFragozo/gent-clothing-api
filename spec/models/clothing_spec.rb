# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Clothing, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:dresscode) }
    it { should validate_presence_of(:color) }
  end
end 