
FactoryGirl.define do
  factory :curso, :class => Refinery::Cursos::Curso do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

