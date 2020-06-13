# frozen_string_literal: true

FactoryBot.define do
  factory :author, class: Author do |factory|
  end
  factory :random_author, class: Author do |factory|
    factory.name { Faker::Book.author }
    factory.bio { Faker::Lorem.paragraph }
  end
  factory :uncle_bob, class: Author do |factory|
    factory.name { 'Robert C. Martin' }
    factory.bio { 'Bio' }
  end
end
