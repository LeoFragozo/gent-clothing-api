# frozen_string_literal: true

require 'rails_helper'

RSpec.describe City, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:country) }
  end
end 
