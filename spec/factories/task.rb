FactoryBot.define do
  factory :task do
    association :user
    title { Faker::Lorem.sentence(word_count: 3) }
    description { Faker::Lorem.paragraph }
    priority { %w[low medium high].sample }
    status { %w[pending in_progress completed].sample }
  end
end
