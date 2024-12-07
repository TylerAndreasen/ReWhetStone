FactoryBot.define do
  factory :player do
    username { 'First last' }
    display_name { 'Fancy Pants' }
    use_display_name { true }
    email { 'myemail@gmail.com' }
    password { 'password' }
  end
end