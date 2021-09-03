FactoryBot.define do
  factory :item do

    title {"フリマ太郎のフィギュア"}
    catch_copy {"フリマ太郎の等身大フィギュア"}
    category_id {2}
    condition_id {2}
    postage_id {2}
    shipping_date_id {2}
    prefecture_id {2}
    price {1000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end