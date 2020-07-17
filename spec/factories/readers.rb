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
  factory :georgezhukov, class: Reader do |factory|
    factory.name { 'George' }
    factory.email { 'kirill.georgezhukov@rubygarage.org' }
    factory.city { 'Dnipro' }
    factory.street { 'Shalom-Aleihema' }
    factory.house { 426 }
  end
  factory :valikos, class: Reader do |factory|
    factory.name { 'Valik' }
    factory.email { 'kirill.valikos@rubygarage.org' }
    factory.city { 'Dnipro' }
    factory.street { 'Shalom-Aleihema' }
    factory.house { 426 }
  end
  factory :gelique, class: Reader do |factory|
    factory.name { 'vito' }
    factory.email { 'kirill.vito@rubygarage.org' }
    factory.city { 'Dnipro' }
    factory.street { 'Shalom-Aleihema' }
    factory.house { 426 }
  end
  factory :gremax, class: Reader do |factory|
    factory.name { 'Maximka' }
    factory.email { 'kirill.gremax@rubygarage.org' }
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
