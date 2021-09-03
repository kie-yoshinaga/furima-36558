class OrderHistoryAddress
  include ActiveModel::Model
    attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

    with_options presence: true do
      
      validates :user_id
      validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
      validates :phone_number, format: {with: /\A[a-z0-9]+\z/i, message: "is invalid. Input only number"}
      validates :city
      validates :house_number
      validates :token
      validates :item_id
    end
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    

    def save
 
      order_history = OrderHistory.create(item_id: item_id, user_id: user_id)
      # 住所を保存する
      # order_history_idには、変数order_historyのidと指定する
      Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_history_id: order_history.id)
    end
end