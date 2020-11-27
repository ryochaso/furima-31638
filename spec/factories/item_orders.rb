FactoryBot.define do
  factory :item_order do
    token                   {"tok_abcdefghijk00000000000000000"}
    postal_code             {"000-0000"}
    prefecture_id           {2}
    city                    {"テスト市試験町"}
    house_number            {"テスト"}
    buillding               {"テストビル"}
    phone_number            {"00000000000"} 
  end
end
