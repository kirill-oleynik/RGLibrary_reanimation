# frozen_string_literal: true

FactoryBot.define do
  factory :order, class: Order do
  end
  factory :developer_order, class: Order do |factory|
    factory.book { build(:clean_architecture) }
    factory.reader { build(:kirilloleynik) }
    # factory.date { DateTime.parse('2020-10-10') }
    factory.date { Date.parse('10/10/2020') }
  end
  factory :random_order, class: Order do |factory|
    factory.book { build(:random_book) }
    factory.reader { build(:random_reader) }
    factory.date { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short) }
  end
end
