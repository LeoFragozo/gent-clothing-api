# frozen_string_literal: true

FactoryBot.define do
  factory :city do
    name { 'Carazinho' }
    state { 'Rio Grande do Sul' }
    country { 'Brasil' }
  end
end
