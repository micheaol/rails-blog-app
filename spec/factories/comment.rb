FactoryBot.define do
  factory :comment do
    user
    post
    text { 'Comment for the Test' }
  end
end
