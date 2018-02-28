FactoryGirl.define do
  factory :user do
    first_name {Faker::Name.primer_nombre}
    last_name  {Faker::Name.apellido}
    email {"#{primer_nombre}.#{apellido}@hotmail.com"}
    username  {"#{primer_nombre}_#{apellido}"}
    password 'abc123'
    association :role, factory: :user_role

    factory :admin_user do
      association :role, factory: :admin_role
    end
    factory :trainer_user do
      association :role, factory: :trainer_role
    end
  end
end