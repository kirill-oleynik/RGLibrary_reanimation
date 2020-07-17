# frozen_string_literal: true

FactoryBot.define do
  factory :order, class: Order do
  end
  factory :developer_order, class: Order do |factory|
    factory.book { build(:clean_architecture) }
    factory.reader { build(:kirilloleynik) }
    factory.date { Date.parse('10/10/2020') }
  end
  factory :developer_order_2, class: Order do |factory|
    factory.book { build(:python_zen) }
    factory.reader { build(:georgezhukov) }
    factory.date { Date.parse('10/10/2020') }
  end
  factory :developer_order_3, class: Order do |factory|
    factory.book { build(:clean_architecture) }
    factory.reader { build(:valikos) }
    factory.date { Date.parse('10/10/2020') }
  end
  factory :developer_order_4, class: Order do |factory|
    factory.book { build(:clean_architecture) }
    factory.reader { build(:gelique) }
    factory.date { Date.parse('10/10/2020') }
  end
  factory :developer_order_5, class: Order do |factory|
    factory.book { build(:you_dont_know_js) }
    factory.reader { build(:gremax) }
    factory.date { Date.parse('10/10/2020') }
  end
  factory :random_order, class: Order do |factory|
    factory.book { build(:random_book) }
    factory.reader { build(:random_reader) }
    factory.date { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short) }
  end
end
