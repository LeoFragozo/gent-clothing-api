# frozen_string_literal: true

require 'rails_helper'

RSpec.describe City, type: :model do
  subject { 
    City.new(name: "Carazinho",
      state: "Rio Grande do Sul",
      country: "Brasil")
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a city" do
    subject.name = nil
    expect(subject).to_not be_valid
  end 
  it "is not valid without a state" do
    subject.state = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a country" do
    subject.country = nil
    expect(subject).to_not be_valid
  end

end 
