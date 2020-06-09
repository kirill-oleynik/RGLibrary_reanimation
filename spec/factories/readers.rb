# frozen_string_literal: true

FactoryBot.define do
  factory :reader, class: Reader do
  end
  factory :kirilloleynik, class: Reader do |factory|
    factory.name { 'Kirill' }
    factory.email { 'kirill.oleynik@rubygarage.org' }
    factory.city { 'Dnipro' }
    factory.street { 'Shalom-Aleihema' }
    factory.house { 426 }
  end
  factory :random_reader, class: Reader do |factory|
    factory.name { Faker::Name.name }
    factory.email { Faker::Internet.email }
    factory.city { Faker::Address.city }
    factory.street { Faker::Address.street_name }
    factory.house { Faker::Address.building_number.to_i }
  end
end
