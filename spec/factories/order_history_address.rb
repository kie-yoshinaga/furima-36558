FactoryBot.define do
  factory :order_history_address do
    postal_code {"123-4567"}
    prefecture_id {2}
    city {"静岡市"}
    house_number {"お茶好き1-1"}
    building_name {"メゾン急須"}
    phone_number {"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
    #user_id {2}
  end
end