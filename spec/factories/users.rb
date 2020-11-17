FactoryBot.define do
  factory :user do
    nickname              {"abc"}
    email                 {"aaa@gmail.com"}
    password              {"12345a"}
    password_confirmation {password}
    family_name           {"平がな"}
    first_name            {"平がな"} 
    kana_family           {"ヒラガナ"} 
    kana_first            {"ヒラガナ"} 
    birthday              {"1930-01-01"}
  end
end