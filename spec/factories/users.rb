FactoryBot.define do
  factory :user do
    nick_name { 'furima太郎' }
    email                 { 'sample@sample.com' }
    password              { 'a1a1a1' }
    password_confirmation { 'a1a1a1' }
    family_name           { '山田' }
    family_name_reading   { 'ヤマダ' }
    first_name            { '太郎' }
    first_name_reading    { 'タロウ' }
    birthday              { '1930-01-01' }
  end
end
