# frozen_string_literal: true

FactoryBot.define do
  factory :book, class: Book do |factory|
  end
  factory :clean_architecture, class: Book do |factory|
    factory.title { 'Clean Architecture' }
    factory.author { build :uncle_bob }
  end
end
