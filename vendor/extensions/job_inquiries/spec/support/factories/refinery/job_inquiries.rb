
FactoryGirl.define do
  factory :job_inquiry, :class => Refinery::JobInquiries::JobInquiry do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

