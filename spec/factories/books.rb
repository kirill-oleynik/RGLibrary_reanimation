# frozen_string_literal: true

FactoryBot.define do
  factory :book, class: Book do |factory|
  end
  factory :clean_architecture, class: Book do |factory|
    factory.title { 'Clean Architecture' }
    factory.author { build :uncle_bob }
  end
  factory :python_zen, class: Book do |factory|
    factory.title { 'Python Zen' }
    factory.author { build :guido_van_rossum }
  end
  factory :you_dont_know_js, class: Book do |factory|
    factory.title { 'Python Zen' }
    factory.author { build :kyle_dimpson }
  end
  factory :random_book, class: Book do |factory|
    factory.title { Faker::Book.title }
    factory.author { build(:random_author) }
  end
end
