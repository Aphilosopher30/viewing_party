FactoryBot.define do
  factory :party do
    association :host, factory: :user

    date { Faker::Date.forward(days: 30) }
    start_time { '07:00' }
    movie_id { 76341 }
    title { 'Mad Max: Fury Road' }
    duration { 121 }
  end
end